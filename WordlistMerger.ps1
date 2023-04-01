# Getting path to first list
do
{
    $Path1 = Read-Host -Prompt "Enter the path for the first list"
}
while (!(Test-Path $Path1) -or ((Get-Item $Path1) -is [System.IO.DirectoryInfo]))

# Getting path to second list
do
{
    $Path2 = Read-Host -Prompt "Enter the path for the second list"
}
while (!(Test-Path $Path2) -or ((Get-Item $Path2) -is [System.IO.DirectoryInfo]))

# Getting path to output list to
$OutputPath = Read-Host -Prompt "Enter the path for the output of the merged list"

# Some error checking for if file already exists or if path is a folder to add a default of mergedList.txt as the file name
try
{
    if ((Get-Item $OutputPath -ErrorAction Stop) -is [System.IO.DirectoryInfo])
    {
        $OutputPath = $OutputPath+"\mergedList.txt"
    }

    # Checks for existing file
    if (!((Get-Item $OutputPath -ErrorAction Stop) -is [System.IO.DirectoryInfo]))
    {
        Write-Host """$OutputPath"" already exists continuing will APPEND to existing file! (CTRL+C to stop or Enter to continue)"
        pause
    }    
}
catch
{
    
}

# Validating with user befdore merger
Write-Host """$Path1"" will be merged with ""$Path2"""
Write-Host "Output will be saved to ""$OutputPath"""
pause

# Reading content of lists
$List1 = Get-Content "$Path1"
$List2 = Get-Content "$Path2"

# The Merging
foreach ($Word1 in $List1)
{
    foreach ($Word2 in $List2)
    {
        Write-Host "$Word1$word2" 
        "$Word1$word2"  | Out-File -FilePath "$OutputPath" -NoClobber -Append -Encoding utf8
    }
}

Write-Host "Output saved to ""$OutputPath"""