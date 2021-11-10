#Requires -Module @{ModuleName = 'Pester'; ModuleVersion = '5.0.0'}
<#
.SYNOPSIS
    Test file for Pester that will verify that the catalog files are in a valid state and meet all defined guidelines. Pull requests that have failing tests are unlikely to be accepted.
#>

BeforeDiscovery {
    $indexFileName = "Index.json"
    $packFileName = "details.json"

    $location = Split-Path $PSCommandPath
    $packFiles = Get-ChildItem $location -Recurse -Filter $packFileName

    $indexPath = Join-Path $location "\$indexFileName"
    $index  = get-content $indexPath -Raw
}

$testCases = @(
    $packFiles.foreach({@{
        name = $_.name
        fullName = $_.fullname
        file = $_
        directory =  $_.directory
        directoryName = $_.directory.name
    }})
)

Describe '<directoryName>' -Tag $directory,'PackTests' -ForEach $testCases {

    Context 'Pack listing' -Tag $directory,'PackTests','PackListing' {

        It "Appears in the index" {
            $regex = '"ManagementPackSystemName"\s*:\s*"' + $directoryName + '"'
            $index -match $regex |
                Should -BeTrue
        }

        It "Has a details.json (case-sensitive)" {
            $FullName |
                Should -Exist

            $Name |
                Should -BeExactly "details.json"
        }

        It "Has a ReadMe.md (case-sensitive)" {
            $readme = $fullName -replace $name, 'ReadMe.md'
            $readme |
                Should -Exist
            # Get-ChildItem is used as Get-Item returns the same case it is passed.
            (Get-ChildItem -Path $directory.fullname -Filter "readme.md").Name |
                Should -BeExactly "ReadMe.md"
        }
    }

    Context 'details.json' -Tag $directory,'PackTests','PackDetails' {
        BeforeAll {
            $contents = Get-Content $fullName -Raw -ErrorAction SilentlyContinue

            # Even with ErrorAction Silent, this could still throw terminating exceptions
            $json = $null
            try { $json = $contents | ConvertFrom-Json -ErrorAction SilentlyContinue } catch {}
        }

        It "Is valid json" {
            {$contents | ConvertFrom-Json } |
                Should -Not -Throw
        }

        It "Has content" {
            $contents |
                Should -Not -BeNullOrEmpty
        }

        It "Has a valid ManagementPackSystemName" {
            $json.ManagementPackSystemName |
                Should -Not -BeNullOrEmpty

            $json.ManagementPackSystemName |
                Should -Match '^[A-Za-z_][A-Za-z0-9_\.]{0,255}$'
        }

        It "ManagementPackSystemName matches folder name" {
            $json.ManagementPackSystemName |
                Should -Be $directoryName
        }

        It "Has a ManagementPackDisplayName" {
            $json.ManagementPackDisplayName |
                Should -Not -BeNullOrEmpty
        }

        It "Has a valid URL" {
            $json.URL |
                Should -Not -BeNullOrEmpty

            [uri]::IsWellFormedUriString($json.URL, [system.urikind]::Absolute) |
                Should -BeTrue
        }

        It "Has a valid Version" {
            $json.Version |
                Should -Not -BeNullOrEmpty

            { [System.Version]::Parse($json.Version) } |
                Should -Not -Throw
        }

        It "Has a Description" {
            $json.Description |
                Should -Not -BeNullOrEmpty
        }

        It "Has an Author" {
            $json.Author |
                Should -Not -BeNullOrEmpty
        }

        It "Has IsFree" {
            $IsFree = $null

            # Treat as false if not specified, as the catalog does
            if (($json.PSObject.Properties | Select-Object -ExpandProperty Name) -notcontains 'IsFree') {
                $IsFree = $false
            } else {
                $IsFree = $json.IsFree
            }

            $IsFree |
                Should -BeOfType System.Boolean
        }

        It "Has an array of Tags" {
            # Explicitly wrap to stop PowerShell from unwrapping during pipeline
            @(,$json.Tags) |
                Should -BeOfType System.Array
        }

        It "Has at least one tag" {
            ($json.Tags | Measure-object).Count |
                Should -BeGreaterThan 0
        }
    }
}