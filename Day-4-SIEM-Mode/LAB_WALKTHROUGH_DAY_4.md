<div align="center">

# 🛡️ File Integrity Monitoring Lab Walkthrough

### 🔍 PowerShell-Based File Integrity Monitoring

<img src="https://img.shields.io/badge/FIM-SHA256-green?style=for-the-badge">
<img src="https://img.shields.io/badge/PowerShell-Automation-blue?style=for-the-badge">
<img src="https://img.shields.io/badge/SOC-Detection-pink?style=for-the-badge">

</div>

---

# 🟣 Day 4 — SIEM Mode (Structured JSON Logging)

## 🎯 Goal

Upgrade the File Integrity Monitoring system to generate **structured JSON logs** with severity classification, enabling compatibility with SIEM platforms such as Splunk, Microsoft Sentinel, and Exabeam.

---

## 🔍 Step 1 — Locate Existing Log Entries

Review the existing log format from previous versions of the script.

![](Screenshots/1.%20Locating%20Original%20Log%20Entries.jpg)

---

## 🔧 Step 2 — Update Log Entry Format

Replace traditional string-based log entries with structured data objects.

```powershell
$logEntry = [PSCustomObject]@{
    timestamp = (Get-Date -Format o)
    severity  = $severity
    user      = $currentUser
    host      = $hostname
    action    = "MODIFIED"
    file      = $entry.FileName
    old_hash  = $entry.Hash
    new_hash  = $currentHash
} | ConvertTo-Json -Compress
```
![](Screenshots/5.%20Updating%20Format%20to%20JSON%20Logs.jpg)

## 🧠 Step 3 — Implement Security Logic & Severity Levels

Add logic to classify alerts based on file sensitivity.

```powershell
$severity = "LOW"

if ($entry.FileName -match "firewall|policy") {
    $severity = "HIGH"
}
elseif ($entry.FileName -match "users") {
    $severity = "MEDIUM"
}
```

## ▶️ Step 4 — Run the Script

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\attacker_tracker_fim.ps1

```

## 🚨 Step 5 — Simulate Attack

Modify a monitored file to trigger detection:

```powershell
notepad monitored_files\firewall.txt
```

Change:

Ports=Closed

To:

Ports=Open

![](Screenshots/4.%20Simulated%20Attack.jpg)

## 🧾 Step 6 — Validate JSON Logging Output

Open the log file:

```powershell
notepad attacker_tracker_log.txt
```

Observe structured JSON output:

{"timestamp":"2026-05-01T...","severity":"HIGH","user":"CHRIS\\Chris","host":"CHRIS","action":"MODIFIED","file":"firewall.txt","old_hash":"...","new_hash":"..."}

![](Screenshots/6.%20New%20JSON%20Format%20for%20SIEM%20Logging.jpg)

## 🧠 Skills Demonstrated (Day 4)

SIEM-style structured logging

JSON data formatting for log ingestion

Severity-based alert classification

Security event normalization

Detection engineering concepts

SOC workflow simulation

Log standardization for analysis tools
