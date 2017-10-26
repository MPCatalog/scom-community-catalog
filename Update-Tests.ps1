<#
.SYNOPSIS
    Deploys the Pack.tests.template.ps1 file out to each pack folder, overwriting the contents.  This is to ensure that all packs have up to date tests prior to running invoke-pester.
#>

[CmdletBinding()]
Param(
    $Path = $PWD,
    $TemplateFile = ".\Pack.tests.template.ps1"
)

$packFiles = Get-ChildItem -Path $Path -Recurse -Filter 'details.json'
foreach ($pack in $packFiles) {
    $folderPath = split-path $pack.FullName
    $destination = Join-Path $folderPath 'Pack.tests.ps1'
    Copy-Item -Path $TemplateFile -Destination $destination -Force
}
