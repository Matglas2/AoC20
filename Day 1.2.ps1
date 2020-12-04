$source = [int32[]](Get-Content ".\Data\Day 1.txt")

function Find-pairs ($number, $list) {
    $list | ForEach-Object {
        $sum = $_ + $number
        if ($sum -lt 2020) {
            $pairs.Add([pscustomobject]@{a = $_;  b = $number; sum = $sum}) | Out-Null
        }
    }
}

function Find-2020 ($number, $list){
    $list | ForEach-Object {
        if (($_.sum + $number) -eq 2020) {
            Write-Host "$($_.a) + $($_.b) + $($number) = 2020 || Answer = $($_.a * $_.b * $number)"
        }
    }
}


# Step 1 find valid unique pairs 
[System.Collections.ArrayList]$pairs = @()
[System.Collections.ArrayList]$todo = $source
$source | ForEach-Object { Find-Pairs $_ $todo; $todo.RemoveAt(0) }

# Step 2 find 2020
$source | ForEach-Object { Find-2020 $_ $pairs }