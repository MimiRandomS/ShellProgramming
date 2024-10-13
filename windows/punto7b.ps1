Clear-Host

function Get-FailedLoginAttempts {
    param (
        [string]$username = "root",
        [int]$eventID = 4625
    )

    try {
        $events = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=$eventID} | Where-Object { $_.Message -match $username }
        
        if ($events) {
            foreach ($event in $events) {
                $eventTime = $event.TimeCreated
                Write-Host "Intento fallido de acceso a '$username' - Fecha y Hora: $eventTime"
            }
            
            $totalAttempts = $events.Count
            Write-Host "Total de intentos de acceso fallidos para '$username': $totalAttempts"
        } else {
            Write-Host "No se encontraron intentos de acceso fallidos para '$username'."
        }
    } catch {
        Write-Host "Error al obtener eventos: $_"
    }
}

Get-FailedLoginAttempts -username "root"
