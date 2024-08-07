$ErrorActionPreference = 'Stop'
import-module au

$releases = "https://www.zimbra.com/zimbra-desktop-download/"

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
     }
}

function global:au_AfterUpdate($Package) {
	Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
	$release = ((Invoke-WebRequest -Uri $releases).Links | Where-Object {$_.href -match ".exe"}).href
    $url32 = $release | Where-Object {$_ -match "exe$"}
    $ChecksumType = ($release | Where-Object {$_ -match "sha"}).split('.')[-1]
    $File = Join-Path $env:TEMP "chocolatey/zimbra-desktop.$($ChecksumType)"
    Invoke-WebRequest -Uri ($release | Where-Object {$_ -match "sha"}) -OutFile $File
    $Checksum = (Get-Content $File).Split(' ')[0]

    $version=Get-Version $url32

	$Latest = @{ URL32 = $url32; Version = $version; Checksum32 = $Checksum; ChecksumType32 = $ChecksumType }
    return $Latest
}

update -ChecksumFor none
