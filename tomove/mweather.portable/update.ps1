$ErrorActionPreference = 'Stop'
import-module au

$release = 'https://www.nirsoft.net/utils/mweather.zip'

function global:au_SearchReplace {
	@{
		'tools/chocolateyInstall.ps1' = @{
			"(^[$]url\s*=\s*)('.*')"      		= "`$1'$($Latest.URL32)'"
			"(^[$]checksum\s*=\s*)('.*')" 		= "`$1'$($Latest.Checksum32)'"
			"(^[$]checksumType\s*=\s*)('.*')" 	= "`$1'$($Latest.ChecksumType32)'"
		}
	}
}

function global:au_AfterUpdate($Package) {
	Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
	$File = Join-Path $env:TEMP "mweather.zip"
	if(Test-Path -Path $File) {
		Remove-Item -Path $File
	}
	Invoke-WebRequest -Uri 'https://www.nirsoft.net/utils/mweather.zip' -OutFile $File
	Expand-Archive -Path $File -DestinationPath "$env:TEMP\MWeather" -Force
	$inf = Get-Content -Path "$env:TEMP\MWeather\mweather.txt"
	$version=($inf | Where-Object {$_ -match 'MetarWeather v'}).split('v') | Select-Object -Last 1

	$Latest = @{ URL32 = $release; Version = $version }
	return $Latest
}

update -ChecksumFor 32 -NoCheckChocoVersion