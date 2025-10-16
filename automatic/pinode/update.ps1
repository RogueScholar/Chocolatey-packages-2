$ErrorActionPreference = 'Stop'
import-module chocolatey-AU

$releases = 'https://minepi.com/pi-blockchain/pi-node/'

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
	. ..\..\scripts\Invoke-VirusTotalScan.ps1
	Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
	$url = ((Invoke-WebRequest -Uri $releases -UseBasicParsing).Links | Where-Object {$_ -match ".exe"} | Select-Object -First 1).href
	$filename = [System.IO.Path]::GetFileName($url)

	if ($filename -match "Setup[\s%20]+([0-9]+\.[0-9]+\.[0-9]+(?:\.[a-zA-Z0-9]+)?)\.exe$") {
    	$version = $matches[1]
	}

	if($version -eq "0.4.11") {
		$version = '0.4.11.2024042801'
	}
	$Latest = @{ URL32 = $url; Version = $version }
	return $Latest
}

update -ChecksumFor 32 -NoCheckChocoVersion
