Clear-Host
function welcome {
    $totalDuration = 5
    $sleepDuration = 0.8
    $totalIterations = [math]::Floor($totalDuration / $sleepDuration)
    $indexIteration = 0
    $symbols = @('--', '/', '|', '\')
    $indexSymbols = 0

    while ($true) {
        Write-Host "------------------------------------------------------"
        Write-Host "|                                                    |"
        Write-Host "|                      @                             |"
        Write-Host "|                    @ @                             |"
        Write-Host "|                  @     @                           |"
        Write-Host "|                @         @                         |"
        Write-Host "|             @              @                       |"
        Write-Host "|            @                @                      |"
        Write-Host "|           @  WELCOME, WINDOWS USER  @              |"
        Write-Host "|            @                @                      |"
        Write-Host "|             @              @                       |"
        Write-Host "|               @           @                        |"
        Write-Host "|                @        @                          |"
        Write-Host "|                  @     @                           |"
        Write-Host "|                    @ @                             |"
        Write-Host "|                      @                             |"
        Write-Host "|                                                    |"
        Write-Host "------------------------------------------------------"
        Write-Host "Loading..."
        $symbolLoad = $symbols[$indexSymbols]
        Write-Host "$symbolLoad"
        Start-Sleep -Seconds $sleepDuration
        Clear-Host
        $indexIteration++
        $indexSymbols++
        
        if ($indexSymbols -eq $symbols.Length) {
            $indexSymbols = 0
        }

        if ($totalIterations -le $indexIteration) {
            return
        }
    }
}

function menu {
    Write-Host "|----------------------------------------------------------|"
    Write-Host "|       Powershell Scripts Menu - Choose an option:        |"
    Write-Host "|----------------------------------------------------------|"
    Write-Host "|  1.  Hello World                       (punto1.ps1)       |"
    Write-Host "|  2.  Number of lines in /etc/profile   (punto2.ps1)       |"
    Write-Host "|  3.  Search word in file               (punto3.ps1)       |"
    Write-Host "|  4a. Create users                      (crearUsuarios.ps1)|"
    Write-Host "|  4b. Users info                        (punto4.ps1)       |"     
    Write-Host "|  5.  List files with permissions       (punto5.ps1)       |"
    Write-Host "|  7a. Check file or directory           (punto7a.ps1)      |"
    Write-Host "|  7b. Check failed root logins          (punto7b.ps1)      |"
    Write-Host "|  0.  Exit                                                |"
    Write-Host "|----------------------------------------------------------|"
}

function Invoke-Script {
    param (
        [string]$scriptName,
        [string[]]$scriptArgs = @()
    )
    $scriptDirectory = Get-Location
    $fullScriptPath = Join-Path -Path $scriptDirectory -ChildPath $scriptName

    if (Test-Path $fullScriptPath) {
        Write-Host "Executing: $fullScriptPath with arguments: $($scriptArgs -join ', ')"
        & $fullScriptPath @scriptArgs
    } else {
        Write-Host "Error: $scriptName no se encuentra en el directorio actual."
    }
}

$sleepDuration1 = 1.8
Welcome
while ($true) {
    menu
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        1 {
            Write-Host "Running punto1.ps1..."
            Invoke-Script "punto1.ps1"
            Start-Sleep -Seconds $sleepDuration1
        }
        2 {
            Write-Host "Running punto2.ps1..."
            Invoke-Script "punto2.ps1"
            Start-Sleep -Seconds $sleepDuration1
        }
        3 {
            $word = Read-Host "Enter the word to search for"
            $path = Read-Host "Enter the path to the file"
            Write-Host "Running punto3.ps1 with parameters '$word' and '$path'..."
            Invoke-Script "punto3.ps1" @($word, $path)
            Start-Sleep -Seconds $sleepDuration1
        }
        4a {
            Write-Host "Running Users Script 4a (crearUsuarios.ps1)..."
            Invoke-Script "crearUsuarios.ps1"
            Start-Sleep -Seconds $sleepDuration1
        }
        4b {
            Write-Host "Running Users Info 4b (punto4.ps1)..."
            Invoke-Script "punto4.ps1"
            Start-Sleep -Seconds $sleepDuration1
        }
        5 {
            $directory = Read-Host "Enter the directory to search in"
            $permissions = Read-Host "Enter the permissions to search for (FullControl, Modify, ReadAndExecute...)"
            Write-Host "Running punto5.ps1 with parameters '$directory' and '$permissions'..."
            Invoke-Script "punto5.ps1" $directory $permissions
            Start-Sleep -Seconds $sleepDuration1
        }
        7a {
            $directory = Read-Host "Enter the search directory"
            $item = Read-Host "Enter the name of the file or subdirectory to search for"
            Write-Host "Running punto7a.ps1 with parameters '$directory' and '$item'"
            Invoke-Script "punto7a.ps1" @($directory, $item)
            Start-Sleep -Seconds $sleepDuration1            
        }        
        7b {
            Write-Host "Running punto7b.ps1 to check failed root logins..."
            Invoke-Script "punto7b.ps1"
            Start-Sleep -Seconds $sleepDuration1
        }
        0 {
            Write-Host "Exiting the program."
            exit
        }
        default {
            Clear-Host
            Write-Host "Invalid option. Please try again."
            Start-Sleep -Seconds $sleepDuration1
        }
    }
}
