#Requires -Version 5.0 -Module @{ModuleName = 'Pester'; ModuleVersion = '5.0.0'}
<#
.SYNOPSIS
    Test file for Pester that will verify that the catalog files are in a valid state and meet all defined guidelines. Pull requests that have failing tests are unlikely to be accepted.
#>

BeforeDiscovery {
    $indexFileName = "Index.json"

    $location = Split-Path $PSCommandPath
    $indexPath = Join-Path $location "\$indexFileName"

    $contents = Get-Content $indexPath -Raw -ErrorAction SilentlyContinue
    $json = ConvertFrom-Json $contents -ErrorAction SilentlyContinue

    $packCases = @(
        $json.foreach({
            $item = $_
            $pack = @{}
            ($item | Get-Member -MemberType NoteProperty).foreach({
                $pack.add($_.Name,$item.$($_.Name))
            })
            $pack
        })
        #Gets all properties from the pack and adds them into test cases
        #Only one property currently but should give future properties for free!
    )

    $indexCase = @(
        @{
            indexPath = $indexPath
            contents = $contents
            json = $json
            location = $location
        }
    )
}

Describe 'Index Tests' -ForEach $indexCase {

    Context 'Index File Validity' {

        It 'Should exist' {
            $indexPath |
                Should -Exist
        }

        It 'Should have content' {
            $contents |
                Should -Not -BeNullOrEmpty
        }

        It 'Should contain valid JSON' {
            {ConvertFrom-Json $contents} |
                Should -Not -Throw
        }
    }

    Context 'Index File Structural Validity' {

        It 'Should be a valid array' {
            # Explicitly wrap to stop PowerShell from unwrapping during pipeline
            @(,$json) |
                Should -BeOfType System.Array
        }

        It 'Should contain objects with a ManagementPackSystemName' -TestCases $packCases {
            $ManagementPackSystemName |
                Should -Not -BeNullOrEmpty
        }

        It 'Is alphabetically sorted and unique' {
            $sortedJson = $json | Sort-Object -Property ManagementPackSystemName -Unique
            $test = for ($i = 0; $i -lt $json.Count; $i++) {
                $json[$i].ManagementPackSystemName -eq $sortedJson[$i].ManagementPackSystemName
            }
            $test |
                Should -Not -Contain $false
        }
    }

    Context 'Content Validity' -Foreach $packCases {

        It "Pack $ManagementPackSystemName has valid ManagementPackSystemName" {
            $ManagementPackSystemName |
                Should -Match '^[A-Za-z_][A-Za-z0-9_\.]{0,255}$'
        }

        It "Pack $ManagementPackSystemName matches folder name" {
            Join-Path $location $ManagementPackSystemName |
                Should -Exist
        }

        It "Pack $name has valid IsActive property" {
            $isActive = $null

            # Treat as true if not specified, as the catalog does
            if (($pack.PSObject.Properties | Select-Object -ExpandProperty Name) -notcontains 'IsActive') {
                $isActive = $true
            } else {
                $isActive = $pack.IsActive
            }

            $isActive |
                Should -BeOfType System.Boolean
        }

    }
}