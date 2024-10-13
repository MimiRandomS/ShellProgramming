Clear-Host

if (-not $args[0] -or -not $args[1]) {
    Write-Host "Uso: $($MyInvocation.MyCommand.Name) <path> <item>"
    exit
}

$directory = $args[0]
$item = $args[1]

function Get-ItemStatus {
    param (
        [string]$directoryPath,
        [string]$itemName
    )

    $fullPath = Join-Path -Path $directoryPath -ChildPath $itemName

    if (-Not (Test-Path $directoryPath)) {
        Write-Host "Error: The directory '$directoryPath' doesn't exist."
        return
    }

    if (Test-Path $fullPath) {
        if (Test-Path -Path $fullPath -PathType Container) {
            Write-Host "'$itemName' is a subdirectory in '$directoryPath'."
        } elseif (Test-Path -Path $fullPath -PathType Leaf) {
            Write-Host "'$itemName' is a file in '$directoryPath'."
        } else {
            Write-Host "'$itemName' is another type of object in '$directoryPath'."
        }
    } else {
        Write-Host "'$itemName' not found in '$directoryPath'."
    }
}

Get-ItemStatus -directoryPath $directory -itemName $item
