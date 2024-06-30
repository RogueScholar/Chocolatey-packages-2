$ErrorActionPreference = 'Stop'
import-module au

$releases = 'https://github.com/openhab/openhab-distro/releases/latest'
$Owner = $releases.Split('/') | Select-Object -Last 1 -Skip 3
$repo = $releases.Split('/') | Select-Object -Last 1 -Skip 2
function global:au_SearchReplace {
	@{
		"legal\VERIFICATION.txt"      = @{
			"(?i)(x86:).*"        				= "`${1} $($Latest.URL32)"
			"(?i)(checksum:).*" 				= "`${1} $($Latest.Checksum32)"
			"(?i)(checksumtype:).*" 			= "`${1} $($Latest.ChecksumType32)"
		}
	}
}

function global:au_BeforeUpdate {
	Get-RemoteFiles -Purge -NoSuffix
  }

function global:au_AfterUpdate($Package) {
	Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
	$tags = Get-GitHubRelease -OwnerName $Owner -RepositoryName $repo -Latest
	$url32 = $tags.assets.browser_download_url | Where-Object {$_ -match ".zip$"}
	$version = $tags.tag_name.Replace('v','').Replace('.M','-M')
	Update-Metadata -key "releaseNotes" -value $tags.html_url
	Update-Metadata -key "licenseUrl" -value $((Get-GitHubLicense -OwnerName $Owner -RepositoryName $repo).download_url)
	if($tags.prerelease -match "true") {
	    $date = $tags.published_at.ToString("yyyyMMdd")
	    $version = "$version-pre$($date)"
	}


	$Latest = @{ URL32 = $url32; Version = $version }
	return $Latest
}

update -ChecksumFor 32
