# SilentlyContinue for the assembly add, this will throw an error after the first run because of 'Duplicate Type'
$ErrorActionPreference = "SilentlyContinue"
Add-Type @'
    public class IndexEntry
    {
        public string ManagementPackSystemName {get; set; }
    }

'@ 
$ErrorActionPreference = "Continue"

Write-Host "MP Catalog Status:`n"

# Load up the index
[IndexEntry[]]$MPIndex = gc Index.json | ConvertFrom-Json

If($MPIndex -eq $null) {Write-Host "This needs to be run with the current directory of the Catalog Contents"}

foreach($IndexItem in $MPIndex)
    {
        $detailFilePath = (".\{0}\details.json" -f $IndexItem.ManagementPackSystemName)

        #Check for a matching folder
        If(Test-Path -Path $detailFilePath)
            {                
                #Path found
                $DetailsToTest = gc  $detailFilePath | ConvertFrom-Json

                #Mandatory Property Tests
                if($DetailsToTest.ManagementPackSystemName.Length -lt 1)
                    {
                        Write-Host ("{0}: Missing ManagementPackSystemName" -f $detailFilePath) -ForegroundColor Red
                    }
                if($DetailsToTest.ManagementPackDisplayName.Length -lt 1)
                    {
                        Write-Host ("{0}: Missing ManagementPackDisplayName" -f $detailFilePath) -ForegroundColor Red
                    }
                if($DetailsToTest.URL.Length -lt 1)
                    {
                        Write-Host ("{0}: Missing URL" -f $detailFilePath) -ForegroundColor Red
                    }
                if($DetailsToTest.Version.Length -lt 1)
                    {
                        Write-Host ("{0}: Missing Version" -f $detailFilePath) -ForegroundColor Red
                    }
                if($DetailsToTest.Author.Length -lt 1)
                    {
                        Write-Host ("{0}: Missing Author" -f $detailFilePath) -ForegroundColor Red
                    }

                #Optional Properties
                if($DetailsToTest.Description.Length -lt 1)
                    {
                        Write-Host ("{0}: Missing Description" -f $detailFilePath) -ForegroundColor Yellow
                    }
                if($DetailsToTest.Tags.Count -lt 1)
                    {
                        Write-Host ("{0}: Missing Tags" -f $detailFilePath) -ForegroundColor Yellow
                    }

            }
        else
            {
                Write-Host ("`nYou are missing a folder for {0}" -f $IndexItem.ManagementPackSystemName) -ForegroundColor Red
                
                # Try and find it if we can
                gci -Recurse -Filter details.json | 
                            % {$fileInPipe = $_; gc $fileInPipe.FullName |
                                     ConvertFrom-Json |
                                     ? {$_.ManagementPackSystemName -eq $IndexItem.ManagementPackSystemName} | 
                                     % {Write-Host ("We found the MP System name here: {0}`n" -f $fileInPipe.FullName) -ForegroundColor Green}}  
            }

    }

# Sort the index for human readability and export
$MPIndex | sort -Property ManagementPackSystemName -Unique | ConvertTo-Json |Out-File Index.json -Encoding ascii -Force

Write-Host "Looking at all of the details.json files, if we found any values that are not in Index.Json they are below"
# Look at all the detail files to see if they are in the index
gci -Recurse -Filter details.json | 
                            % {$fileInPipe = $_; gc $fileInPipe.FullName |
                                     ConvertFrom-Json |
                                     ? {[string[]]($MPIndex | select ManagementPackSystemName -ExpandProperty ManagementPackSystemName) -notcontains $_.ManagementPackSystemName} | 
                                     % {Write-Host ("MPSystemName wasn't in the index: {0}, located at: {1}" -f $_.ManagementPackSystemName, $fileInPipe.FullName) -ForegroundColor DarkRed -BackgroundColor White}}  

Read-Host