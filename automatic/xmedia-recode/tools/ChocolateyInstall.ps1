﻿$ErrorActionPreference = 'Stop'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$TodaysVersion = ($ENV:ChocolateyPackageVersion -replace '[.]','')
 
$packageArgs = @{
  packageName    = "$ENV:ChocolateyPackageName"
  fileType       = 'EXE'
  file           = "$toolsDir\XMediaRecode"+$TodaysVersion+"_setup.exe"
  file64         = "$toolsDir\XMediaRecode"+$TodaysVersion+"_x64_setup.exe"
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}
 
Install-ChocolateyInstallPackage @packageArgs

Remove-Item "$toolsDir\*.exe" -ErrorAction SilentlyContinue | Out-Null

# UPDATE INSTRUCTIONS:
# Replace the .EXE files
