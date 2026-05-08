<div align="center">

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:00FF9C,100:0066FF&height=200&section=header&text=File%20Integrity%20Monitoring%20(FIM)%20Lab&fontSize=35&fontColor=ffffff&animation=fadeIn" />
</p>

### 🛡️ PowerShell-Based File Integrity Monitoring & Threat Detection Lab

![PowerShell](https://img.shields.io/badge/PowerShell-Automation-blue?style=for-the-badge&logo=powershell)
![Security](https://img.shields.io/badge/SOC-Threat%20Detection-purple?style=for-the-badge)
![Hashing](https://img.shields.io/badge/SHA256-Integrity%20Validation-green?style=for-the-badge)
![SIEM](https://img.shields.io/badge/SIEM-Ready-orange?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey?style=for-the-badge&logo=windows)

</div>

---

## 🚨 Key Highlight

This project simulates a **real-world File Integrity Monitoring (FIM) system**, evolving from basic hashing to a **SOC-ready detection pipeline** with:

- 🔍 Threat detection  
- 🧠 Attacker attribution  
- 📊 Severity classification  
- 📦 Structured JSON logging (SIEM-ready)

---

## 📌 Overview

This lab demonstrates how cybersecurity analysts **detect, investigate, and log unauthorized file activity** using PowerShell.

The project is built in phases to mirror a real SOC workflow:

> Detection → Scaling → Attribution → SIEM Integration

---

## 🧠 Project Evolution

### 🟢 Day 1 — Basic Hashing & Single File Monitoring
- Generate SHA256 baseline hash
- Monitor a single critical file
- Detect unauthorized modifications
- Implement basic alerting and logging

[📄 Day 1 Walkthrough](Day-1-Basic-Hashing-and-FIM/LAB_WALKTHROUGH_DAY_1.md)

---

### 🔵 Day 2 — Multi-File Monitoring
- Monitor entire directories instead of a single file
- Store baseline hashes in CSV format
- Detect file modifications and deletions
- Expand logging across multiple assets

[📄 Day 2 Walkthrough](Day-2-Multi-File-Monitoring/LAB_WALKTHROUGH_DAY_2.md)

---

### 🔴 Day 3 — Attacker Tracking & Attribution
- Identify **who** modified files (user + host)
- Detect file modifications and deletions
- Enhance logs with contextual data
- Implement baseline updates to reduce alert fatigue
- Simulate insider threat activity

[📄 Day 3 Walkthrough](Day-3-Attacker-Tracker/LAB_WALKTHROUGH_DAY_3.md)

---

### 🟣 Day 4 — SIEM Mode (Structured Logging)
- Convert logs into **structured JSON format**
- Implement severity levels (LOW / MEDIUM / HIGH)
- Normalize security events for ingestion
- Simulate SOC alert pipelines
- Prepare logs for SIEM platforms (Splunk, Sentinel, Exabeam)
 
[📄 Day 4 Walkthrough](Day-4-SIEM-Mode/LAB_WALKTHROUGH_DAY_4.md)

---

## 🧪 Features

- ✅ SHA256 file integrity validation  
- ✅ Multi-file & directory monitoring  
- ✅ File modification and deletion detection  
- ✅ Attacker attribution (user + host)  
- ✅ Severity-based alert classification  
- ✅ JSON structured logging (SIEM-ready)  
- ✅ Baseline management & alert tuning  
- ✅ Simulated attack scenarios  

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| PowerShell | Automation & scripting |
| SHA256 | File integrity hashing |
| Windows File System | File monitoring |
| CSV | Baseline storage |
| JSON | Structured logging for SIEM |
| GitHub | Version control & documentation |

---

## 🚨 Detection Scenario

A system is continuously monitored for unauthorized changes.

An attacker:
- Modifies critical configuration files  
- Deletes monitored assets  

The system:
- Detects changes via hash comparison  
- Identifies the responsible user and host  
- Assigns severity based on file sensitivity  
- Logs events in structured JSON format for SIEM ingestion  

---

## 📸 Screenshots

Each phase includes detailed screenshots and walkthroughs:

- 📁 Day 1 → Basic Detection  
- 📁 Day 2 → Multi-File Monitoring  
- 📁 Day 3 → Attacker Attribution  
- 📁 Day 4 → SIEM Logging  

👉 See individual walkthroughs for full visuals.

---

## 🧠 Skills Demonstrated

- PowerShell Scripting  
- File Integrity Monitoring (FIM)  
- SHA256 Hashing  
- Security Event Logging  
- Threat Detection & Analysis  
- Attacker Attribution  
- SIEM Log Structuring (JSON)  
- Detection Engineering Concepts  
- SOC Workflow Simulation  

---

## 🚀 Future Improvements

- ⚡ Real-time monitoring (FileSystemWatcher)  
- 📡 SIEM integration (Splunk / Sentinel ingestion)  
- 📧 Email / webhook alerting  
- 📊 Dashboard visualization  
- 🌐 Threat intelligence enrichment  

---

## 💼 Why This Project Matters

This project demonstrates the ability to:

✔ Build detection systems from scratch  
✔ Simulate real-world SOC workflows  
✔ Transition from raw data → actionable intelligence  
✔ Prepare logs for enterprise security platforms  

---

## 🔗 Connect With Me

💼 [LinkedIn](https://www.linkedin.com/in/chris-stoute-157040164/)

---
