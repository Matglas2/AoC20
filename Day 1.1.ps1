
function Find-2020 ($number, $list) {
    $list | ForEach-Object {
        if (($_ + $number) -eq 2020) {
            Write-Host "$($_) + $($number) = 2020 || Answer = $($_ * $number)"
        }
    }
}

$a = [int32[]](Get-Content ".\Data\Day 1.txt")
[System.Collections.ArrayList]$b = $a

$a | ForEach-Object { Find-2020 $_ $b; $b.RemoveAt(0) }
