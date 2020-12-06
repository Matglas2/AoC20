
$source = (Get-Content ".\Data\Day 6.txt" -raw); $part2 = 0
Write-Host "Part 1:" $(($source -split "`n`n" | % { ($_.Replace("`n", "").ToCharArray() | Sort-Object -Unique).count } | Measure-Object -sum).Sum)

$source -split "`n`n" | % {
    $lines = $($_ | Measure-Object -Line).Lines
    $_.Replace("`n", "").ToCharArray() | Group-Object -NoElement | % { if ($_.Count -eq $lines) { $part2 ++ } }
}

Write-host "Part 2:" $part2