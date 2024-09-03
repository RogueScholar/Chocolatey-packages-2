$ErrorActionPreference = 'Stop'
import-module au

$releases = 'https://www.xmedia-recode.de/en/index.php'

function global:au_SearchReplace {
	@{
		"legal\VERIFICATION.txt"      = @{
			"(?i)(x32:).*"        				= "`${1} $($Latest.URL32)"
			"(?i)(checksum32:).*" 				= "`${1} $($Latest.Checksum32)"
			"(?i)(x64:).*"        				= "`${1} $($Latest.URL64)"
			"(?i)(checksum64:).*" 				= "`${1} $($Latest.Checksum64)"
			"(?i)(checksumtype:).*" 			= "`${1} $($Latest.ChecksumType32)"
		}
	}
}

function global:au_AfterUpdate($Package) {
	Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
	$page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$regexPattern = 'XMedia Recode (\d+(\.\d+)*)'
	$versionMatch = $page.Content | Select-String -Pattern $regexPattern -AllMatches
	$version = $versionMatch.Matches[0].Groups[1].Value
	$versionfile = ($version -replace '[.]','')
	$url32 = "https://www.xmedia-recode.de/download/XMediaRecode$($versionfile)_setup.exe"
	. ..\..\scripts\Get-FileVersion.ps1
	$FileVersion32 = Get-FileVersion $url32 -keep
	Move-Item $FileVersion32.TempFile -Destination "tools\XMediaRecode_setup.exe"
	$url64 = "https://www.xmedia-recode.de/download/XMediaRecode$($versionfile)_x64_setup.exe"
	$FileVersion64 = Get-FileVersion $url64 -keep
	Move-Item $FileVersion64.TempFile -Destination "tools\XMediaRecode_x64_setup.exe"

	$Latest = @{ URL32 = $url32; URL64 = $url64; Checksum32 = $FileVersion32.Checksum; ChecksumType32 = $FileVersion32.ChecksumType; Checksum64 = $FileVersion64.Checksum; ChecksumType64 = $FileVersion64.ChecksumType; Version = $version }
	return $Latest
}

update -ChecksumFor none
