$ErrorActionPreference = 'Stop'
import-module Chocolatey-AU
Import-Module ..\..\scripts\au_extensions.psm1

$releases = 'https://installers.friendsofapachenetbeans.org/'
$github = 'https://github.com/Friends-of-Apache-NetBeans/netbeans-installers/releases/latest'
$Owner = $github.Split('/') | Select-Object -Last 1 -Skip 3
$repo = $github.Split('/') | Select-Object -Last 1 -Skip 2

function global:au_SearchReplace {
	@{
		'tools/chocolateyInstall.ps1' = @{
			"(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
			"(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
			"(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
		}
	}
}

function global:au_AfterUpdate($Package) {
	Invoke-VirusTotalScan $Package
}

function global:au_BeforeUpdate {
	. ..\..\scripts\Get-FileVersion.ps1
	$FileVersion = Get-FileVersion $Latest.URL64
	$Latest.Checksum64 = $FileVersion.Checksum
	$Latest.ChecksumType64 = $FileVersion.checksumType
}

function global:au_GetLatest {
	$Page = Invoke-WebRequest -Uri $releases -UserAgent "Update checker of Chocolatey Community Package 'Netbeans'"
	$release = ($Page.Links | Where-Object {$_ -match "download/"}).href | Where-Object {$_ -match "exe"} | Select-Object -First 1

	$tags = Get-GitHubRelease -OwnerName $Owner -RepositoryName $repo -Latest
	#Update-Metadata -key "releaseNotes" -value $tags.html_url

	$version=($release.Split('/') | Where-Object {$_ -match "[0-9][0-9]"} | Where-Object {$_ -notmatch 'exe'}).Substring(1).replace('-','.0-')
	if($version -notmatch '\.') {
		$version+=".0"
	}
	if($version -match "25.0") {
		$version = "25.0.0.20250801"
	}

	$Latest = @{ URL64 = $release; Checksum64 = $Checksum; ChecksumType64 = $ChecksumType; Version = $version }
	return $Latest
}

update -ChecksumFor none -NoCheckChocoVersion
