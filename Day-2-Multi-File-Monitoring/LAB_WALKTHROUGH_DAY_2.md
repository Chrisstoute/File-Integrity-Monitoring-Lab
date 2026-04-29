<div align="center">

# 🛡️ File Integrity Monitoring Lab Walkthrough

### 🔍 PowerShell-Based File Integrity Monitoring

<img src="https://img.shields.io/badge/FIM-SHA256-green?style=for-the-badge">
<img src="https://img.shields.io/badge/PowerShell-Automation-blue?style=for-the-badge">
<img src="https://img.shields.io/badge/SOC-Detection-pink?style=for-the-badge">

</div>

---

# 🔵 Day 2 — Multi-File Monitoring

## 🎯 Goal

Enhance the File Integrity Monitoring system to monitor multiple files simultaneously, store baseline hashes in a structured format, and detect changes across an entire directory.

---

## 📁 Step 1 — Create Day 2 Project Structure

```powershell
cd $HOME\Documents\HashLab
mkdir Day-2-Multi-File-Monitoring
cd Day-2-Multi-File-Monitoring
mkdir monitored_files
```

## 📄 Step 2 — Create Files to Monitor

```powershell
notepad monitored_files\firewall.txt
```

Firewall=Enabled

Ports=Closed

```powershell
notepad monitored_files\policy.txt
```

PasswordPolicy=Strong

MFA=Enabled

```powershell
notepad monitored_files\users.txt
```

Admin=Enabled

Guest=Disabled

![](Screenshots/1.%20Creating%20Monitored%20Files%20Directory.jpg)

## 🔐 Step 3 — Create Multi-File FIM Script

```powershell
notepad multi_fim_monitor.ps1
```

![](Screenshots/2.%20Creating%20Multi-File%20Monitoring%20Script.jpg)

## 📁 ⚙️ Step 4 — Script Behavior

The script performs two main functions:

#🟢 First Run — Baseline Mode
- Calculates SHA256 hashes for all files
- Stores hashes in:

```powershell
baseline_hashes.csv
```

#🔴 Second Run — Monitoring Mode
- Compares current hashes to the saved baseline
- Detects file modifications
- Detects deleted files
- Outputs alerts to the console
- Logs alerts to:

```powershell
multi_fim_log.txt
```

## ▶️ Step 5 — Run the Script

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\multi_fim_monitor.ps1
```

First run creates the baseline.

Second run starts monitoring.

![](Screenshots/3.%20Running%201st%20Multi-File%20Script.jpg)

## 🚨 Step 6 — Simulate Multi-File Attack

```powershell
notepad monitored_files\firewall.txt
```

Change:

Ports=Closed

To:

Ports=Open

You can also simulate file deletion:

```powershell
del monitored_files\users.txt
```

![](Screenshots/4.%20Simulated%20Attack%20-%20Modified%20%26%20Delete%20Files.jpg)

## 🧾 Step 7 — Logging Output

Logs are written to:

```powershell
multi_fim_log.txt
```

Example log:

```powershell
2026-04-28 09:50:00 | HIGH | File modified: firewall.txt | Old Hash: ... | New Hash: ...
```

#🧠 Skills Demonstrated (Day 2)

Multi-file monitoring

Directory-based integrity checks

CSV baseline storage

PowerShell automation

Security logging across multiple assets

Real-world SOC detection simulation

File modification detection

File deletion detection
