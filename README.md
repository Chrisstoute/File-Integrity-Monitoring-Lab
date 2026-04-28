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

This project demonstrates a simulated **File Integrity Monitoring (FIM)** system capable of detecting unauthorized file modifications in real time using **SHA256 hashing**, mirroring techniques used in SOC environments.

---

## 📌 Overview

This lab simulates a real-world cybersecurity monitoring workflow where a critical configuration file is baselined, monitored, modified, and then detected as changed.

The goal is to demonstrate how hashing can be used to verify file integrity and identify possible unauthorized tampering.

---

## 🧪 Features

- Generates a trusted SHA256 baseline hash
- Continuously monitors a target file for changes
- Detects unauthorized modifications in real time
- Simulates attacker-driven configuration tampering
- Provides PowerShell-based alert output

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| PowerShell | Script automation |
| SHA256 | File integrity hashing |
| Windows File System | Local file monitoring |
| GitHub | Project documentation and version control |

---

## 🚨 Scenario

A critical system configuration file is monitored for unauthorized changes.  
An attacker modifies the file by enabling remote access.  
The PowerShell monitoring script detects the hash mismatch and alerts that the file has been modified.

---

## ▶️ Usage

```powershell
.\fim_monitor.ps1
```

---


## 📸 Step-by-Step Demo (Day 1)

### 1️⃣ Creating the Lab Directory
![Step 1](Day-1-Basic-Hashing-and-FIM/screenshots/1.%20Making%20HashLab%20Directory.jpg)

---

### 2️⃣ Generating Baseline Hash
![Step 2](Day-1-Basic-Hashing-and-FIM/screenshots/2.%20Getting%20Baseline%20Hash.jpg)

---

### 3️⃣ Simulating Configuration Change
![Step 3](Day-1-Basic-Hashing-and-FIM/screenshots/3.%20Updated%20from%20Disabled%20to%20Enabled.jpg)

---

### 4️⃣ Detecting Hash Change
![Step 4](Day-1-Basic-Hashing-and-FIM/screenshots/4.%20Updated%20Hash.jpg)

---

### 5️⃣ Creating the FIM Script
![Step 5](Day-1-Basic-Hashing-and-FIM/screenshots/5.%20Creating%20File%20Integrity%20Monitoring%20Script.jpg)

---

### 6️⃣ Running the Monitoring Script
![Step 6](Day-1-Basic-Hashing-and-FIM/screenshots/6.%20Running%20FIM%20Script.jpg)

---

### 7️⃣ Simulated Attack Detection
![Step 7](Day-1-Basic-Hashing-and-FIM/screenshots/7.%20Simulated%20Attack.jpg)