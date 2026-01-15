# 🛡️ Pi-Zero-Hybrid-Toolkit

A versatile, lightweight, and robust **Red Team / Blue Team** toolkit for the Raspberry Pi Zero W. Built on the stability of **DietPi**, this toolkit provides automated connectivity, self-healing network logic, and a suite of security tools.

## 🚀 Features

- **Triple Mode Operation:** Choose between **Red Team (Attacker)**, **Blue Team (Defender)**, or **Tactical Assistant (AI Helper)** modes.
- **Self-Healing WiFi:** Background monitoring service that automatically reconnects if the connection drops.
- **USB Gadget Mode:** Access your Pi via USB Ethernet or Serial—no WiFi required.
- **Web-Based Management:**
  - **Terminal:** Access a full shell from your browser at port `8080`.
  - **Dashboard:** Visual system management via Cockpit at port `9090`.
- **IP Discovery:** Rapid LED blinking pattern and `my_ip.txt` file generation for easy discovery.

## 🛠️ Installation

1. **Download DietPi:** Get the latest Raspberry Pi Zero W image from [DietPi.com](https://dietpi.com/).
2. **Flash the Image:** Use [BalenaEtcher](https://www.balena.io/etcher/) to flash the image to your SD card.
3. **Apply Toolkit Scripts:**
   - Copy `scripts/Automation_Custom_Script.sh` to the `/boot` partition of your SD card.
   - Copy `scripts/Automation_Custom_PreScript.sh` to the `/boot` partition.
   - Edit `dietpi-wifi.txt` on the SD card with your WiFi credentials.
4. **Select Mode (Optional):**
   - **Red Team (Default):** No action needed.
   - **Blue Team:** Create an empty file named `mode_blue` on the `/boot` partition.
   - **Tactical Assistant:** Create an empty file named `mode_assistant` on the `/boot` partition.
5. **Boot:** Insert the card into your Pi Zero W and power it on.

## 📂 Included Tools

### 🔴 Red Team Mode
- `nmap`: Network exploration and security auditing.
- `bettercap`: The Swiss Army knife for 802.11, BLE, and Ethernet networks.
- `aircrack-ng`: WiFi security auditing tools.
- `tshark`: Network protocol analyzer.

### 🔵 Blue Team Mode
- `fail2ban`: Intrusion prevention framework.
- `snort`: Open-source intrusion detection system.
- `tcpdump`: Command-line packet analyzer.
- `iptables-persistent`: Advanced firewall management.

### 🤖 Tactical Assistant Mode
- **AI-Driven Intel:** Analyzes Red Team logs and provides aggressive tactical suggestions.
- **Automated Support:** Background service that monitors and assists the primary operator.
- **Intel Logging:** Centralized tactical intelligence stored in `assistant_intel.log`.

## 🔑 Default Credentials
- **User:** `root`
- **Password:** `dietpi`

---
## ⚖️ Legal & Ethical Use
This toolkit is provided under the **MIT License**. By using this software, you agree to the terms in the [DISCLAIMER.md](DISCLAIMER.md). The developer is **not responsible** for any misuse or damage. **Authorized use only.** Recommended for use in **VM vs. VM** environments.
