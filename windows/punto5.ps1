Clear-Host

if (-not $args[0] -or -not $args[1]) {
    Write-Host "Uso: $($MyInvocation.MyCommand.Name) <path> <permission>"
    exit
}

$path = $args[0]
$permission = $args[1]

if (-not (Test-Path $path)) {
    Write-Host "El directorio no existe."
    exit
}

function Convert-Permission {
    param (
        [string]$permission
    )
    
    switch ($permission) {
        "FullControl" { return "Everyone" }
        "Modify"      { return "Modify" }
        "ReadAndExecute" { return "ReadAndExecute" }
        "Read"        { return "Read" }
        "Write"       { return "Write" }
        default { return "FullControl" }
    }
}

$files = Get-ChildItem -Path $path -File

$matchingFiles = @()
foreach ($file in $files) {
    $acl = Get-Acl -Path $file.FullName
    foreach ($access in $acl.Access) {
        if ($access.IdentityReference -eq "Everyone" -and $access.FileSystemRights -eq "FullControl") {
            $matchingFiles += $file
            break
        }
    }
}

if ($matchingFiles.Count -gt 0) {
    Write-Host "Archivos encontrados con el permiso '$permission':"
    $matchingFiles | ForEach-Object { Write-Host $_.FullName }
} else {
    Write-Host "No se encontraron archivos con el permiso '$permission'."
}
