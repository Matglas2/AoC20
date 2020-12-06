$seats = Get-Content '.\Data\Day 5.txt' | % { [PSCustomObject]@{
    row = [Convert]::ToInt32($_.Substring(0,7) -replace('F',0) -replace('B',1),2)
    col = [Convert]::ToInt32($_.Substring(7,3) -replace('L',0) -replace('R',1),2)
}}
$rowWithValidEmptySeat = ($seats | Group-Object -Property Row | ? {$_.count -eq 7}).group

Write-Host "Part 1:" ($seats | % { $_.Row * 8 + $_.col} | Measure-Object -Maximum).Maximum
Write-Host "Part 2:" $($rowWithValidEmptySeat[0].row * 8 + (0..7 | ? {$_ -notin $tesp.col}))