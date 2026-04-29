<div align="center">

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:00FF9C,100:0066FF&height=200&section=header&text=File%20Integrity%20Monitoring%20(FIM)%20Lab&fontSize=35&fontColor=ffffff&animation=fadeIn" />
</p>

### PowerShell-Based File Tamper Detection Using SHA256 Hashing

![PowerShell](https://img.shields.io/badge/PowerShell-File%20Integrity%20Monitoring-blue?style=for-the-badge&logo=powershell)
![Security](https://img.shields.io/badge/SOC-Detection%20Lab-purple?style=for-the-badge)
![Hashing](https://img.shields.io/badge/SHA256-Hashing-green?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey?style=for-the-badge&logo=windows)

</div>

---

## 🚨 Key Highlight

This project simulates a **real-world File Integrity Monitoring (FIM) system** that evolves from basic file hashing to **multi-file monitoring, attack detection, logging, and SOC-style alerting**.

---

## 📌 Overview

This lab demonstrates how cybersecurity analysts detect unauthorized file changes using hashing and monitoring techniques.

The project is built in phases, progressively adding more advanced capabilities to simulate a real SOC environment.

---

## 🧠 Project Roadmap

### 🟢 Day 1 — Basic Hashing & Single File Monitoring
- Generate SHA256 baseline hash
- Monitor a single critical file
- Detect unauthorized modifications
- Implement basic alerting and logging

📄 Walkthrough:  
`Day-1-Basic-Hashing-and-FIM/LAB_WALKTHROUGH_DAY_1.md`

---

### 🔵 Day 2 — Multi-File Monitoring
- Monitor entire directories instead of a single file
- Store baseline hashes in CSV format
- Detect file modifications and deletions
- Expand logging across multiple assets

📄 Walkthrough:  
`Day-2-Multi-File-Monitoring/LAB_WALKTHROUGH_DAY_2.md`

---

### 🔥 Day 3 — (Coming Next) Attacker Tracking & Attribution
- Identify which user modified files
- Capture process-level activity
- Enhance logs with attribution data
- Simulate insider threat scenarios

---

### 🧠 Day 4 — (Planned) SIEM Mode
- Convert logs into SIEM-style format
- Add severity levels (LOW / MEDIUM / HIGH)
- Enable structured log ingestion
- Simulate SOC alert workflows

---

## 🧪 Features

- SHA256 file integrity validation
- Real-time file monitoring
- Multi-file and directory monitoring
- File modification and deletion detection
- Structured logging system
- Simulated attacker behavior
- SOC-style alert generation

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| PowerShell | Automation and scripting |
| SHA256 | File integrity hashing |
| Windows File System | File monitoring |
| CSV | Baseline storage |
| GitHub | Version control and documentation |

---

## 🚨 Scenario

A system is monitored for unauthorized changes.

An attacker modifies configuration files or deletes critical assets.  
The monitoring system detects the activity, compares hashes against a trusted baseline, and generates alerts with detailed logging.

---

## ▶️ Usage

### Day 1 (Single File Monitoring)
```powershell
.\fim_monitor.ps1
```

### Day 2 (Multi-File Monitoring)
```powershell
.\multi_fim_monitor.ps1
```

#📸 Screenshots

Refer to each day's walkthrough for step-by-step visuals and demonstrations.


#🧠 Skills Demonstrated

PowerShell Scripting

File Integrity Monitoring (FIM)

SHA256 Hashing

Security Event Logging

Threat Detection

Directory Monitoring

Incident Simulation

SOC Workflow Concepts


🚀 Future Improvements

Real-time file system watcher (instead of polling)

Integration with SIEM platforms

Email or webhook alerting

Dashboard visualization

Threat intelligence enrichment

