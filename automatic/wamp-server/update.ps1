$ErrorActionPreference = 'Stop'
import-module au

$releases = "https://wampserver.aviatechno.net/"

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
     }
}

function global:au_AfterUpdate($Package) {
	Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
    $url32 = "$($releases)$((((Invoke-WebRequest -Uri $releases -UseBasicParsing).Links | Where-Object {$_ -match 'exe'}).href) | Where-Object {$_ -match 'x64'} | Select-Object -First 1)"
    if ($url32 -match "(\d+\.\d+\.\d+)_x64\.exe") {
        $version = $matches[1]
    }

	$Latest = @{ URL32 = $url32; Version = $version }
    return $Latest
}

update -ChecksumFor 32 -NoCheckChocoVersion
