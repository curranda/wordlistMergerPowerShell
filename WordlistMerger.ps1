$List1 = Get-Content "C:\Temp\List1.txt"
$List2 = Get-Content "C:\Temp\List2.txt"

foreach ($Word1 in $List1)
{
    foreach ($Word2 in $List2)
    {
        Write-Host "$Word1$word2" 
        "$Word1$word2"  | Out-File -FilePath "C:\Temp\mergedList.txt" -NoClobber -Append
        
    }
}