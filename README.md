<![CDATA[<div align="center">

![Banner](assets/banner.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-cyan.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Raspberry%20Pi%20Zero%20W-red.svg)](https://www.raspberrypi.org/)
[![DietPi](https://img.shields.io/badge/OS-DietPi-green.svg)](https://dietpi.com/)
[![Status](https://img.shields.io/badge/Status-Active-success.svg)]()

**A versatile, lightweight, and robust Red Team / Blue Team / AI Assistant toolkit for the Raspberry Pi Zero W.**

Built on the rock-solid foundation of **DietPi**, this toolkit provides automated connectivity, self-healing network logic, USB gadget mode, and a comprehensive suite of security tools—all controllable from your phone.

[Features](#-features) • [Installation](#-installation) • [Demo](#-demo) • [Tools](#-included-tools) • [Legal](#%EF%B8%8F-legal--ethical-use)

</div>

---

## 🚀 Features

![Features](assets/features.png)

The Pi-Zero-Hybrid-Toolkit is designed to be the ultimate portable security platform. Whether you're conducting authorized penetration tests, defending your network, or leveraging AI-driven tactical intelligence, this toolkit has you covered.

### Core Capabilities

**Triple Mode Operation:** Choose your role at boot time by simply creating a file on the SD card. No complex configuration required.

**Self-Healing WiFi:** A background monitoring service continuously checks your connection. If the network drops, the system automatically attempts reconnection using multiple strategies. Your Pi stays online even in unstable environments.

**USB Gadget Mode:** Transform your Pi Zero W into a USB Ethernet and Serial device. Plug it directly into a target computer via the USB port for access without any WiFi dependency.

**Phone-Friendly Control:** Access a full-featured web terminal from any mobile browser. No SSH app required—just open your phone's browser and start working. The responsive interface adapts perfectly to mobile screens.

**LED Feedback System:** Visual confirmation of system status through programmed LED blink patterns. Know instantly when your Pi is online and operational.

**AI-Driven Intelligence:** The Tactical Assistant mode analyzes scan results in real-time and provides aggressive, actionable recommendations to accelerate your operations.

---

## 📊 System Architecture

![Architecture](assets/architecture.png)

The toolkit supports three distinct operational modes, each optimized for specific security tasks. All modes can work independently or in coordination for complex scenarios.

---

## 🎯 Demo: Toolkit in Action

### Network Reconnaissance
![Network Scan Demo](assets/demo_nmap.png)
*Automated network scanning discovers vulnerable services across the target environment.*

### AI Tactical Assistant
![Assistant Demo](assets/demo_assistant.png)
*Real-time AI analysis provides prioritized recommendations and suggested exploit chains.*

### Mobile Control
<div align="center">
<img src="assets/demo_mobile.png" width="300">
</div>

*Full terminal access from your phone—control your operations from anywhere.*

---

## 🛠️ Installation

### Prerequisites
- Raspberry Pi Zero W
- MicroSD card (8GB minimum, 16GB recommended)
- [DietPi](https://dietpi.com/) image for Raspberry Pi Zero W
- [BalenaEtcher](https://www.balena.io/etcher/) or similar flashing tool

### Step-by-Step Setup

**1. Flash the Base Image**

Download the latest DietPi image for Raspberry Pi Zero W and flash it to your SD card using BalenaEtcher.

**2. Apply Toolkit Scripts**

Mount the SD card on your computer. You should see a partition named `boot`. Copy the following files from this repository to the boot partition:

```
scripts/Automation_Custom_Script.sh → /boot/
scripts/Automation_Custom_PreScript.sh → /boot/
assistant/tactical_assistant.py → /boot/assistant/
```

**3. Configure WiFi**

Edit the `dietpi-wifi.txt` file on the boot partition. Replace the placeholders with your actual WiFi credentials:

```bash
aWIFI_SSID[0]='YOUR_WIFI_NAME_HERE'
aWIFI_KEY[0]='YOUR_WIFI_PASSWORD_HERE'
```

**4. Select Operational Mode**

Choose your mode by creating an empty file on the boot partition:

| Mode | Action |
|------|--------|
| **Red Team** (Default) | No action needed |
| **Blue Team** | Create empty file: `mode_blue` |
| **Tactical Assistant** | Create empty file: `mode_assistant` |

**5. Boot and Wait**

Insert the SD card into your Pi Zero W and power it on. The first boot takes approximately 5-10 minutes as the system installs tools and configures services.

**6. Verify Connection**

Watch for the LED to blink rapidly 10 times—this confirms successful network connection. You can also check the `my_ip.txt` file on the boot partition for the assigned IP address.

---

## 📂 Included Tools

### 🔴 Red Team Mode

Red Team mode installs an aggressive offensive toolkit designed for authorized penetration testing and security assessments.

| Tool | Purpose |
|------|---------|
| **nmap** | Network exploration and security auditing |
| **bettercap** | Complete network attack framework for WiFi, BLE, and Ethernet |
| **aircrack-ng** | WiFi security auditing and WEP/WPA cracking |
| **tshark** | Command-line network protocol analyzer |
| **python3** | Scripting and exploit development |

### 🔵 Blue Team Mode

Blue Team mode focuses on defensive security, intrusion detection, and network monitoring.

| Tool | Purpose |
|------|---------|
| **fail2ban** | Intrusion prevention through automated IP banning |
| **snort** | Real-time network intrusion detection system |
| **tcpdump** | Packet capture and network traffic analysis |
| **iptables-persistent** | Advanced firewall configuration and management |

### 🤖 Tactical Assistant Mode

Tactical Assistant mode deploys an AI-driven support system that monitors Red Team operations and provides real-time tactical intelligence.

**Capabilities:**
- Analyzes scan results and identifies high-value targets
- Suggests exploit chains based on discovered vulnerabilities
- Provides timing recommendations to avoid detection
- Logs all intelligence to `assistant_intel.log` for review

---

## 🔑 Access & Credentials

### Default Login
- **Username:** `root`
- **Password:** `dietpi`

### Access Methods

**Web Terminal (Recommended for Mobile)**
```
http://<pi-ip-address>:8080
```

**Cockpit Dashboard**
```
http://<pi-ip-address>:9090
```

**SSH**
```bash
ssh root@<pi-ip-address>
```

**mDNS Hostname**
```
pizerow.local
```

---

## ⚖️ Legal & Ethical Use

This toolkit is provided under the **MIT License**. By downloading, installing, or using any part of this software, you acknowledge and agree to the following:

**This software is intended for:**
- Educational purposes and security research
- Authorized penetration testing with explicit permission
- Defensive security operations on networks you own or have authorization to protect

**You agree that:**
- You will use this toolkit only on systems and networks for which you have explicit authorization
- You assume full professional and legal responsibility for your actions
- The developer(s) cannot and will not be held liable for any misuse, damage, or legal consequences

**Strongly Recommended:** Use this toolkit exclusively in isolated environments such as **VM vs. VM** setups or dedicated security labs.

For complete legal terms, see [DISCLAIMER.md](DISCLAIMER.md).

---

## 🤝 Contributing

Contributions are welcome! If you have ideas for new features, improvements, or bug fixes, please open an issue or submit a pull request.

---

## 📜 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

<div align="center">

**Made with 🛡️ for the security community**

*Remember: With great power comes great responsibility. Use wisely.*

</div>
]]>
