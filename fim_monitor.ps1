# File to monitor
$file = "system_config.txt"

# Baseline file
$baselineFile = "baseline_hash.txt"

# Step 1: Create baseline if it doesn't exist
if (!(Test-Path $baselineFile)) {
    $hash = Get-FileHash $file -Algorithm SHA256
    $hash.Hash | Out-File $baselineFile
    Write-Host "[+] Baseline created. Run script again to monitor." -ForegroundColor Green
    exit
}

# Step 2: Load baseline
$baselineHash = Get-Content $baselineFile

Write-Host "[*] Monitoring file for changes..." -ForegroundColor Yellow

# Step 3: Continuous monitoring loop
while ($true) {
    Start-Sleep -Seconds 5

    $currentHash = (Get-FileHash $file -Algorithm SHA256).Hash

    if ($currentHash -ne $baselineHash) {
        Write-Host "[!!!] WARNING: File has been modified!" -ForegroundColor Red
        Write-Host "Old Hash: $baselineHash"
        Write-Host "New Hash: $currentHash"
    } else {
        Write-Host "[OK] No changes detected." -ForegroundColor Green
    }
}