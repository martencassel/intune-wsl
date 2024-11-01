try {
    Remove-Item c:\from_intune.txt
} catch {
    Write-Debug $_
}
