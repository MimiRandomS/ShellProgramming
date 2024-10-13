Clear-Host
$path = "C:\Windows\System32\drivers\etc\hosts"
$lineas = (Get-Content -Path $path).Count
Write-Host "El numero de lineas del archivo $path es: $lineas"
