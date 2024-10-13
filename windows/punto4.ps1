Clear-Host

$localUsers = Get-LocalUser

$result = @()

foreach ($user in $localUsers) {
    $result += [PSCustomObject]@{
        Name        = $user.Name
        Description = $user.Description
    }
}

$result | Format-Table -AutoSize
