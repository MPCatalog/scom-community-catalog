<#
.SYNOPSIS
    Test file for Pester that will verify that the index.json file is in a valid state and meet all defined guidelines. Pull requests that have failing tests are unlikely to be accepted.
#>

[CmdletBinding()]
Param()

$location = Split-Path $script:MyInvocation.MyCommand.Path
$indexFileName = "Index.json"

Describe "Index.json" -Tag $location {
    $path = Join-Path $location $indexFileName
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
                $json[$i].ManagementPackSystemName | Should Be $sortedJson[$i].ManagementPackSystemName
            }
        }
    }

    Context 'Content Validity' {
        
        foreach ($pack in $json) {
            $name = $pack.ManagementPackSystemName
            It "Pack $name matches folder name" {
                $path = Join-Path $pwd $name
                $path | Should Exist
            }
        }
    }
}
