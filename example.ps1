#region config
$clientName = "Intune.Training"
$examplePath "C:\ProgramData\$clientName"
$appName = "ExampleScript"
$logFile = "$appName.log"
#endregion
#region logging?
if (-not (Test-Path -Path $clientName)) {
    New-Item -Path $examplePath -ItemType Directory -Force | Out-Null
}
Start-Transcript $logFile -Force
#endregion
#region main process
try {
    $txtFile = "thisshouldbehere.txt"
    New-Item -Path "$examplePath\somefile.txt" -ItemType File -Force | Out-Null
    if (-not (Test-Path -Path "$examplePath\$txtFile" -ErrorAction SilentlyContinue)) {
        Throw "File not found"
    }
    else {
        return $true
    }
}
catch {
    $errorVar = $_.exception.Message
}
finally {
    if ($errorVar) {
        Write-Host "Something went wrong: $errorVar"
        Stop-Transcript
        throw $errorVar
    }
    else {
        Write-Host "All good"
        Stop-Transcript
    }
}
#endregion