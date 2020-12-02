class Password {
    [int] $min
    [int] $max
    [char] $char
    [string] $password
    
    Password([string] $rawInput){
        $x = $rawInput -split '(.+)-(.+) (.{1}): (.*)'
        $this.min = $x[1]
        $this.max = $x[2]
        $this.char = $x[3]
        $this.password = $x[4]
    }

    [bool] ValidPart1(){
        $count = @($this.password.ToCharArray() | ? {$_ -eq $this.char}).Count
        return ($count -ge $this.min) -and ($count -le $this.max)
    }

    [bool] ValidPart2(){
        $indexes = @($this.password | Select-String -AllMatches $this.char).Matches.Index
        return (($indexes -contains ($this.min - 1)) -and ($indexes -notcontains ($this.max - 1))) -or 
               (($indexes -contains ($this.max - 1)) -and ($indexes -notcontains ($this.min - 1)))
    }
}

[Password[]]$passwords = Get-Content ".\Day 2.txt"
Write-Host "Count:" @($passwords | ? { $_.ValidPart1()}).Count
Write-Host "Count:" @($passwords | ? { $_.ValidPart2()}).Count