function CircleJerk ($max, $current, $increment) {
        $wish = $current + $increment                              #Find where we end up
        if ($wish -le $max){ return $wish }                        #If x inbound, all is fine
        else { return ($wish - $max) -1 }                          #If not start over and add remainder
}

function TestPath ($path, $xstep, $ystep) {
    $forest = Get-Content $path                                    #Load to 2D array
    $x = 0; $y = 0; $count = 0;                                    #Set vars
    while ($y -le ($forest.Length -1)) {
        if ($forest[$y][$x] -eq "#") { $count++ }                  #Find tree at y.x location
        $x = CircleJerk ($forest[0].Length -1) $x $xstep           #Move cursor x
        $y += $ystep;                                              #Move cursor y
    }
    return $count
}

Write-Host "Right 1, down 1 | $(TestPath '.\Day 3.txt' 1 1)"
Write-Host "Right 3, down 1 | $(TestPath '.\Day 3.txt' 3 1)"
Write-Host "Right 5, down 1 | $(TestPath '.\Day 3.txt' 5 1)"
Write-Host "Right 7, down 1 | $(TestPath '.\Day 3.txt' 7 1)"
Write-Host "Right 1, down 2 | $(TestPath '.\Day 3.txt' 1 2)"