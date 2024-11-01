Clear-Host

if (-not $args[0] -or -not $args[1]) {
    Write-Host "Uso: $($MyInvocation.MyCommand.Name) <path> <permission>"
    exit
}

$path = $args[0]
$permission = $args[1]

if (-Not (Test-Path -Path $path -PathType Container)) {
    Write-Host "Directorio invalido."
    exit 1
}

Get-ChildItem -Path $path -File | Where-Object {
    (Get-Acl $_.FullName).AccessToString -match $($permission)
} | Format-Table FullName


