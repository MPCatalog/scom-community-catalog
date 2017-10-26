<#
.SYNOPSIS
    Test file for Pester that will verify that the catalog files are in a valid state and meet all defined guidelines. Pull requests that have failing tests are unlikely to be accepted.
#>

[CmdletBinding()]
Param()

$indexFileName = "Index.json"
$packFileName = "details.json"

$location = Split-Path $script:MyInvocation.MyCommand.Path

$packFiles = Get-ChildItem $location -Recurse -Filter $packFileName

$indexPath = Join-Path $location "..\$indexFileName"
$index  = get-content $indexPath -Raw

foreach ($packFile in $packFiles) {
    $folderName = (Split-Path $packFile.psparentpath -Leaf)
    $folderPath = split-path $packFile.FullName 
    $contents = Get-Content $packFile.FullName -Raw -ErrorAction SilentlyContinue
    $json = $contents | ConvertFrom-Json -ErrorAction SilentlyContinue

    Describe "$folderName" -Tag "$folderPath" {

        Context 'Pack Listing' {
            
            It "Appears in the index" {
                $regex = '"ManagementPackSystemName"\s*:\s*"' + $folderName + '"'
                $index -match $regex | Should Be True
            }

            It "Has a details.json" {
                $packFile.FullName | Should Exist
            }

            It "Has a Readme.md" {
                $readme = $packFile.FullName -replace $packFileName, 'README.md'
                $readme | Should Exist
            }
        }

        Context 'details.json' {
            
            It "details.json is valid json" {
                { $contents | ConvertFrom-Json } | Should Not Throw 
            }

            It "details.json has content" {
                $contents | Should Not BeNullOrEmpty
            }

            It "Has a ManagementPackSystemName" {
                $json.ManagementPackSystemName | Should Not BeNullOrEmpty
            }

            It "ManagementPackSystemName matches folder name" {
                $json.ManagementPackSystemName | Should Be $folderName
            }
    
            It "Has a ManagementPackDisplayName" {
                $json.ManagementPackDisplayName | Should Not BeNullOrEmpty
            }
    
            It "Has a valid URL" {
                $json.URL | Should Not BeNullOrEmpty
                $validUrl = [uri]::IsWellFormedUriString($json.URL, [system.urikind]::Absolute)
                $validUrl | Should Be True
            }
    
            It "Has a valid Version" {
                $json.Version | Should Not BeNullOrEmpty
                { [System.Version]::Parse($json.Version) } | Should Not Throw
            }
    
            It "Has a Description" {
                $json.Description | Should Not BeNullOrEmpty
            }
    
            It "Has an Author" {
                $json.Author | Should Not BeNullOrEmpty
            }
    
            It "Has IsFree" {
                $json.IsFree | Should BeOfType System.Boolean
            }
    
            It "Has an array of Tags" {
                # Explicitly wrap to stop PowerShell from unwrapping during pipeline
                @(,$json.Tags) | Should BeOfType System.Array
            }
    
            It "Has at least one tag" {
                $tagCount = ($json.Tags | Measure-object).Count
                $tagCount| Should BeGreaterThan 0
            }

        }
    }
}
