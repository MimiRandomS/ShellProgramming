Clear-Host

$path = Read-Host "Enter the directory to search in"
$permission = Read-Host "Enter the permissions to search for (FullControl, Modify, ReadAndExecute...)"

if (-Not (Test-Path -Path $path -PathType Container)) {
    Write-Host "Directorio invalido."
    exit 1
}

Get-ChildItem -Path $path -File | Where-Object {
    (Get-Acl $_.FullName).AccessToString -match $($permission)
} | Format-Table FullName


