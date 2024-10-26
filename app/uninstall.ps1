function Exit-Reboot {
    Write-Host "Uninstalled application"
    exit 1641
}

function Main {
    $LogPath = "C:\temp\install.log"
    if (-not (Test-Path -Path "C:\temp")) {
        New-Item -Path "C:\temp" -ItemType Directory -Force
    }
    Start-Transcript -Path $LogPath -Append

    Disable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

    Write-Host "Uninstalled application"
    Exit-Reboot
}

try {
    Main
} catch {
    Write-Error "Failed to uninstall WSL2: $_"
    Stop-Transcript
    exit 1
}


