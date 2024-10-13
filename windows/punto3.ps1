Clear-Host

if (-not $args[0] -or -not $args[1]) {
    Write-Host "Uso: $($MyInvocation.MyCommand.Name) <word> <path>"
    exit
}

$word = $args[0]
$path = $args[1]

if (-not (Test-Path $path)) {
    Write-Host "El archivo no existe."
    exit
}

function findWord {
    param (
        [string]$word,
        [string]$path
    )

    $content = Get-Content -Path $path
    $actualLine = 1
    $foundLines = @()

    foreach ($linea in $content) {
        if ($linea -match $word) {
            $foundLines += $actualLine
        }
        $actualLine++
    }

    return $foundLines
}

$resultLines = findWord $word $path

if ($resultLines.Count -gt 0) {
    Write-Host "La palabra '$word' se encontro en las lineas: $($resultLines -join ', ')"
} else {
    Write-Host "La palabra '$word' no se encontro en el archivo."
}
