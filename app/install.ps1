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

    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart
    Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All -NoRestart

    Write-Host "Installed application"
    Exit-Reboot
}


try {
    Main
} catch {
    Write-Error "Failed to install WSL2: $_"
    Stop-Transcript
    exit 1
}