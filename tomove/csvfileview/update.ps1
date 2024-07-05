$ErrorActionPreference = 'Stop'
import-module au

$url32 = 'https://www.nirsoft.net/utils/csvfileview.zip'
# $url64 = 'https://www.nirsoft.net/utils/csvfileview-x64.zip'


Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

function global:au_SearchReplace {
	@{
		'tools/chocolateyInstall.ps1' = @{
			"(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
			"(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
			"(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}
	}
}

function global:au_BeforeUpdate($Package) {
	Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
	$File = "./csvfileview.zip"
	Invoke-WebRequest -Uri $url32 -OutFile $File -UseBasicParsing
	Expand-Archive $File -DestinationPath .\csvfv

	$version=$(Get-Content .\csvfv\readme.txt | Where-Object {$_ -match 'CSVFileView'})[0].split(' ')[-1].Replace('v','')

	$Latest = @{ URL32 = $url32; Version = $version}
	return $Latest
}

update -ChecksumFor 32
