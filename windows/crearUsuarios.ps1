Clear-Host

$pass = ConvertTo-SecureString "Us3r" -AsPlainText -Force
$name = "ShellUser"

for ($i = 1; $i -le 5; $i++) {
    $userName = "$name $i"
    New-LocalUser -Name $userName -Password $pass -Description "Shell User"
    Add-LocalGroupMember -Group "Users" -Member $userName
}

Write-Host "The users have been created."
