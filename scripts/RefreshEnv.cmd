@echo off
REM RefreshEnv.cmd: A batch file to read environment variables from the registry
REM and set session environment to those values. This batch file should obviate
REM the need to invoke the interpreter anew to propagate environment changes.

REM Store existing terminal code page then set to 65001 (UTF-8).
for /f "tokens=4 delims=: " %%g in ("%SystemRoot%\System32\chcp.com") do (
  set OriginalCodePage=%%g
)
"%SystemRoot%\System32\chcp.com" 65001 >NUL

REM Code by @beatcracker <https://github.com/beatcracker/detect-batch-subshell>.
setlocal EnableDelayedExpansion

REM Dequote path to command processor and this script path.
set ScriptPath=%~0
set CmdPath=%COMSPEC:"=%

REM Get command processor filename and filename with extension.
for %%c in (!CmdPath!) do (
  set CmdExeName=%%~nxc
  set CmdName=%%~nc
)

REM Get this process' PID, adapted from
REM <https://www.dostips.com/forum/viewtopic.php?p=22675#p22675>.
set "uid="
for /l %%i in (1 1 128) do (
  set /a "bit=!random!&1"
  set "uid=!uid!!bit!"
)

for /f "tokens=2 delims==" %%i in (
  "%SystemRoot%\System32\wbem\WMIC.exe Process WHERE "Name='!CmdExeName!' AND CommandLine LIKE '%%!uid!%%'" GET ParentProcessID /value"
) do (
  REM Get commandline of parent
  for /f "tokens=1,2,*" %%j in (
    "%SystemRoot%\System32\wbem\WMIC.exe Process WHERE "Handle='%%i'" GET CommandLine /value"
  ) do (
    REM Strip extra new lines from WMIC output, a la
    REM <https://www.dostips.com/forum/viewtopic.php?t=4266>.
    for /f "delims=" %%x in ("%%l") do (
      REM Dequote path to batch file, if any (3rd argument).
      set ParentScriptPath=%%x
      set ParentScriptPath=!ParentScriptPath:"=!
    )
    REM Get parent process path.
    for /f "tokens=2 delims==" %%y in ("%%j") do (
      REM Dequote parent path.
      set ParentPath=%%y
      set ParentPath=!ParentPath:"=!
      REM Handle various invocations: C:\Windows\system32\cmd.exe, cmd.exe, cmd.
      for %%p in (!CmdPath! !CmdExeName! !CmdName!) do (
        if !ParentPath!==%%p set IsCmdParent=1
      )
      REM Check if cmd.exe was invoked with /c switch & this script as argument.
      if !IsCmdParent!==1 if %%k==/c if "!ParentScriptPath!"=="%ScriptPath%" set IsExternal=1
    )
  )
)
if !IsExternal!==1 (
  echo %~nx0 does not work when run from this process. If you're in PowerShell, please
  echo     'Import-Module ${Env:ChocolateyInstall}\helpers\chocolateyProfile.psm1' and try again.
  exit 1
)
REM End code from @beatcracker.

echo | set /p dummy="  Refreshing environment variables from the registry..."

goto main

REM Set one environment variable from registry key.
:SetFromReg
  "%SystemRoot%\System32\reg.exe" QUERY "%~1" /v "%~2" > "%TEMP%\_envset.tmp" 2>NUL
  for /f "usebackq skip=2 tokens=2,*" %%A IN ("%TEMP%\_envset.tmp") do (
    set "tempvar=%%B"
    REM Remove double quotes from temporary value.
    set "__tempvar=!tempvar:"=!"
    REM Only escape percentage signs when the value type is not defined as an
    REM expandable string.
    if /I NOT "%%~A"=="REG_EXPAND_SZ" (
      set "tempvar=!tempvar:%%=%%%%!"
    )
    REM If the dequoted string differs from the original string, the variable
    REM contains double quotes. Escape | and & in the variable to avoid errors.
    if NOT "!__tempvar!" == "!tempvar!" (
      set "tempvar=!tempvar:|=^|!"
      set "tempvar=!tempvar:&=^&!"
    )
    echo/set "%~3=!tempvar!"
  )
  goto :EOF
REM Get a list of environment variables from registry.
:GetRegEnv
  "%SystemRoot%\System32\reg.exe" QUERY "%~1" > "%TEMP%\_envget.tmp"
  for /f "usebackq skip=2" %%A IN ("%TEMP%\_envget.tmp") do (
    if /I not "%%~A"=="Path" (
      call :SetFromReg "%~1" "%%~A" "%%~A"
    )
  )
  goto :EOF
:main
  echo/@echo off >"%TEMP%\_env.cmd"
  REM Slowly generating final file.
  call :GetRegEnv "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" >> "%TEMP%\_env.cmd"
  call :GetRegEnv "HKCU\Environment">>"%TEMP%\_env.cmd" >> "%TEMP%\_env.cmd"
  REM Special handling for PATH - mix both User and System scopes.
  call :SetFromReg "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" Path Path_HKLM >> "%TEMP%\_env.cmd"
  call :SetFromReg "HKCU\Environment" Path Path_HKCU >> "%TEMP%\_env.cmd"
  endlocal
  REM Caution: Do not insert whitespace characters before >> redirection sign.
  echo/set "Path=%%Path_HKLM%%;%%Path_HKCU%%" >> "%TEMP%\_env.cmd"
  REM Cleanup.
  del /f /q "%TEMP%\_envset.tmp" 2>NUL
  del /f /q "%TEMP%\_envget.tmp" 2>NUL
  REM Capture user / architecture.
  set "OriginalUserName=%USERNAME%"
  set "OriginalArchitecture=%PROCESSOR_ARCHITECTURE%"
  REM Set these variables.
  call "%TEMP%\_env.cmd"
  REM Final cleanup.
  del /f /q "%TEMP%\_env.cmd" 2>NUL
  REM Reset user / architecture / code page.
  set "USERNAME=%OriginalUserName%"
  set "PROCESSOR_ARCHITECTURE=%OriginalArchitecture%"
  "%SystemRoot%\System32\chcp.com" %OriginalCodePage% >NUL
  echo | set /p dummy="   Finished"
  echo .
