<div align="center">



\# 🛡️ File Integrity Monitoring Lab Walkthrough



\### 🔍 PowerShell-Based File Integrity Monitoring



<img src="https://img.shields.io/badge/FIM-SHA256-green?style=for-the-badge">

<img src="https://img.shields.io/badge/PowerShell-Automation-blue?style=for-the-badge">

<img src="https://img.shields.io/badge/SOC-Detection-pink?style=for-the-badge">



</div>



\---



\# 🔴 Day 3 — Attacker Tracker (User Attribution)



\## 🎯 Goal



Enhance the File Integrity Monitoring system to track \*\*who performed file modifications\*\*, including user and host attribution, while maintaining persistent baseline updates.



\---



\## 📁 Step 1 — Create Attacker Tracker Directory



```powershell

cd $HOME\\Documents\\HashLab



mkdir Day-3-Attacker-Tracker



!\[](Screenshots/1.%20Creating%20Attacker%20Tracker%20Directory.jpg)



cd Day-3-Attacker-Tracker



mkdir monitored\_files

```



!\[](Screenshots/2.%20Creating%20Monitored%20Files%20Directory.jpg)



\## 📄 Step 2 — Create Files to Monitor



!\[](Screenshots/3.%20Target%20File%201%20-%20Firewall.jpg)



!\[](Screenshots/4.%20Target%20File%202%20-%20Users.jpg)



!\[](Screenshots/5.%20Target%20File%203%20-%20Policy.jpg)



\## 🛠️ Step 3 — Create Attacker Tracker Script



```powershell

notepad attacker\_tracker\_fim.ps1

```



!\[](Screenshots/6.%20Attacker%20Tracker%20FIM%20Script%20pt%201.jpg)



!\[](Screenshots/7.%20Attacker%20Tracker%20FIM%20Script%20pt%202.jpg)



!\[](Screenshots/8.%20Attacker%20Tracker%20FIM%20Script%20pt%203.jpg)



\## ▶️ Step 4 — Run the Script



```powershell

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

.\\attacker\_tracker\_fim.ps1

```



\##🚨 Step 5 — Simulate Attack



```powershell

notepad monitored\_files\\firewall.txt

```

Change:



Ports=Closed



To:



Ports=Open



\## 🧾 Step 6 — Detection Output



!\[](Screenshots/9.%20Simulated%20Attack.jpg)



The system now logs:



File modification

Username

Host machine

Old hash vs new hash

Action type (Modified / Deleted)



Example:



```powershell

2026-04-30 10:20:00 | HIGH | User: CHRIS\\Chris | Host: CHRIS | Action: Modified | File: firewall.txt

```



\## 🧠 Skills Demonstrated (Day 3)

\-User attribution and tracking

\-Host-level logging

\-Multi-file monitoring

\-Persistent baseline management

\-Alert fatigue reduction (dynamic baseline updates)

\-Security event logging

\-Threat detection with context



