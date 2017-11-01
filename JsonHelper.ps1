$packTypeDefinition = @'
    public class GitHubPackDetailPS
    {
        public string ManagementPackSystemName { get; set; }
        public string ManagementPackDisplayName { get; set; }
        public string URL { get; set; }
        public string Version { get; set; }
        public string Author { get; set; }
        public string Description {get; set;}
        public bool IsFree { get; set; }
        public System.Collections.Generic.IList<string> Tags { get; set; }

        public GitHubPackDetailPS()
        {
            this.Tags = new System.Collections.Generic.List<string>();
        }
    }

    public class IndexEntry
    {
        public string ManagementPackSystemName {get; set; }
    }

'@

Add-Type $packTypeDefinition
$NewPackEntry = New-Object -TypeName GitHubPackDetailPS

Clear-Host
Write-Host "Enter data following the prompts" -ForegroundColor DarkYellow
$NewPackEntry.ManagementPackSystemName = Read-Host -Prompt "Management Pack System Name?"
$NewPackEntry.ManagementPackDisplayName = Read-Host -Prompt "Management Pack Display Name?"
$NewPackEntry.URL = Read-host -Prompt "Pack Download URL?"
$NewPackEntry.Version = Read-Host -Prompt "Current Management Pack Version? (All 4 elements please 1.2.3.4)"
$NewPackEntry.Author = Read-Host -Prompt "Management Pack Author?"
$NewPackEntry.Description = Read-Host -Prompt "Management Pack Description?"
$NewPackEntry.IsFree = Read-Host -Prompt "Is the management pack free? (true or false)"
$TagToAdd = Read-Host -Prompt "Please enter the first management pack tag, order is not important"

while(![string]::IsNullOrWhiteSpace($TagToAdd))
    {
        $NewPackEntry.Tags.Add($TagToAdd)
        Write-Host "Current Tags are:"
        $NewPackEntry.Tags.GetEnumerator() | % { write-host -NoNewline -ForegroundColor Green "$_,"}
        Write-Host
        $TagToAdd = Read-Host -Prompt "Please enter the next tag, or leave blank to proceed"
        cls
    }

# Create a folder for the details
mkdir $NewPackEntry.ManagementPackSystemName

$OutPath = "{0}\{1}" -f $NewPackEntry.ManagementPackSystemName, "details.json"
$OutPathReadme = "{0}\{1}" -f $NewPackEntry.ManagementPackSystemName, "ReadMe.md"
"### " + $NewPackEntry.ManagementPackDisplayName | Out-File $OutPathReadme -Encoding utf8
$NewPackEntry | ConvertTo-Json | Out-File $OutPath -Encoding utf8
    

# Look for index, 
if(Test-Path Index.json)
    {
        [IndexEntry[]]$MPIndex = gc Index.json | ConvertFrom-Json
    }
else
    {
        [IndexEntry[]]$MPIndex = @()
    }

# Add this pack to the index
$ThisPack = New-Object IndexEntry
$ThisPack.ManagementPackSystemName = $NewPackEntry.ManagementPackSystemName
$MPIndex += $ThisPack
$MPIndex | sort -Property ManagementPackSystemName -Unique | ConvertTo-Json |Out-File Index.json -Force -Encoding utf8
&$OutPathReadme
