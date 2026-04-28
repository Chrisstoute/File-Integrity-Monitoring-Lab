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
    $logFile = "fim_log.txt"
	

    if ($currentHash -ne $baselineHash) {

        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logEntry = "$timestamp | ALERT | File modified: $file | Old Hash: $baselineHash | New Hash: $currentHash"

        Write-Host "[!!!] WARNING: File has been modified!" -ForegroundColor Red
        Write-Host "Old Hash: $baselineHash"
        Write-Host "New Hash: $currentHash"

        Add-Content -Path $logFile -Value $logEntry
    } else {
        Write-Host "[OK] No changes detected." -ForegroundColor Green
    }
}