<#
.SYNOPSIS
    Test file for Pester that will verify that the catalog files are in a valid state and meet all defined guidelines. Pull requests that have failing tests are unlikely to be accepted.
#>

[CmdletBinding()]
Param()

$indexFileName = "Index.json"
$packFileName = "details.json"

$packFiles = Get-ChildItem $PWD -Recurse -Filter $packFileName

Describe "Index.json" {
    $path = Join-Path $pwd $indexFileName
    $contents = Get-Content $path -Raw -ErrorAction SilentlyContinue
    $json = ConvertFrom-Json $contents -ErrorAction SilentlyContinue

    Context 'File Validity' {

        It 'Exists' {
            $path | Should Exist
        }

        It 'Has content' {
            $contents | Should Not BeNullOrEmpty
        }

        It 'Contains valid JSON' {
            {ConvertFrom-Json $contents} | Should Not Throw 
        }
    }
    
    Context 'Structural Validity' {
        
        It 'Is a valid array' {
            # Explicitly wrap to stop PowerShell from unwrapping during pipeline
            @(,$json) | Should BeOfType System.Array
        }

        It 'Contains objects with a ManagementPackSystemName' {
            foreach ($pack in $json) {
                $pack.ManagementPackSystemName | Should Not BeNullOrEmpty
            }
        }

        It 'Is alphabetically sorted' {
            $sortedJson = $json | Sort-Object -Property ManagementPackSystemName
            for ($i = 0; $i -lt $json.Count; $i++) {                
                $json[$i].ManagementPackSystemName | Should Be $sortedJson[$i]
            }
        }
    }

    Context 'Content Validity' {
        
        foreach ($pack in $json) {
            $name = $pack.ManagementPackSystemName
            It "$name matches folder name" {
                $path = Join-Path $pwd $name
                $path | Should Exist
            }
        }
    }
}

$indexPath = Join-Path $pwd $indexFileName
$index  = get-content $indexPath -Raw

foreach ($packFile in $packFiles) {
    $folderName = (Split-Path $packFile.psparentpath -Leaf)
    $folderPath = split-path $packFile.FullName 
    $contents = Get-Content $packFile.FullName -Raw -ErrorAction SilentlyContinue
    $json = $contents | ConvertFrom-Json -ErrorAction SilentlyContinue

    Describe "$folderPath" {

        Context 'Pack Listing' {
            
            It 'Appears in the index' {
                $regex = '"ManagementPackSystemName"\s*:\s*"' + $folderName + '"'
                $index -match $regex | Should Be True
            }

            It 'has a details.json' {
                $packFile.FullName | Should Exist
            }

            It 'has a Readme.md' {
                $readme = $packFile.FullName -replace $packFileName, 'README.md'
                $readme | Should Exist
            }
        }

        Context 'details.json' {
            
            It 'Is valid json' {
                { $contents | ConvertFrom-Json } | Should Not Throw 
            }

            It 'Has content' {
                $contents | Should Not BeNullOrEmpty
            }

            It 'Has a ManagementPackSystemName' {
                $json.ManagementPackSystemName | Should Not BeNullOrEmpty
            }

            It 'ManagementPackSystemName matches folder name' {
                $json.ManagementPackSystemName | Should Be $folderName
            }
    
            It 'Has a ManagementPackDisplayName' {
                $json.ManagementPackDisplayName | Should Not BeNullOrEmpty
            }
    
            It 'Has a valid URL' {
                $json.URL | Should Not BeNullOrEmpty
                $validUrl = [uri]::IsWellFormedUriString($json.URL, [system.urikind]::Absolute)
                $validUrl | Should Be True
            }
    
            It 'Has a valid Version' {
                $json.Version | Should Not BeNullOrEmpty
                { [System.Version]::Parse($json.Version) } | Should Not Throw
            }
    
            It 'Has a Description' {
                $json.Description | Should Not BeNullOrEmpty
            }
    
            It 'Has an Author' {
                $json.Author | Should Not BeNullOrEmpty
            }
    
            It 'Has IsFree' {
                $json.IsFree | Should BeOfType System.Boolean
            }
    
            It 'Has an array of Tags' {
                # Explicitly wrap to stop PowerShell from unwrapping during pipeline
                @(,$json.Tags) | Should BeOfType System.Array
            }
    
            It 'Has at least one tag' {
                $tagCount = ($json.Tags | Measure-object).Count
                $tagCount| Should BeGreaterThan 0
            }

        }
    }
}