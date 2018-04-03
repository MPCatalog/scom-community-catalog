<#
.SYNOPSIS
    Deploys the Pack.tests.template.ps1 file out to each pack folder, overwriting the contents.  This is to ensure that all packs have up to date tests prior to running invoke-pester.

.PARAMETER Path
    The location to (recursivly) start searching for packs that need updated tests.

.PARAMETER TemplateFile
    Path to the template file that you want to update the tests with.
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
