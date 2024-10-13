Clear-Host
$path = "C:\prueba\polin.txt"
$lineas = (Get-Content -Path $path).Count
Write-Host "El numero de lineas del archivo $path es: $lineas"
