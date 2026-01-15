#!/bin/bash
# Pi-Zero-Hybrid-Toolkit: Ultimate Setup Script
# This script runs at the end of the DietPi installation process.

LOG_FILE="/boot/toolkit_setup.log"
echo "--- Toolkit Setup Started: $(date) ---" > "$LOG_FILE"

# 1. Detect Mode (Red vs Blue)
# Users can create a file named 'mode_blue' on the boot partition to switch to Blue Team mode.
if [ -f /boot/mode_blue ]; then
    MODE="BLUE"
    echo "[*] Blue Team Mode Detected." >> "$LOG_FILE"
else
    MODE="RED"
    echo "[*] Red Team Mode Detected (Default)." >> "$LOG_FILE"
fi

# 2. Enable USB Gadget Mode (P4wnP1 style)
echo "[*] Enabling USB Gadget Mode (Ethernet + Serial)..." >> "$LOG_FILE"
echo "dtoverlay=dwc2" >> /boot/config.txt
sed -i 's/rootwait/rootwait modules-load=dwc2,g_ether/' /boot/cmdline.txt

# 3. Install Core Management Tools
echo "[*] Installing core management tools (Cockpit, Netdata)..." >> "$LOG_FILE"
dietpi-software install 188 65

# 4. Install Mode-Specific Tools
if [ "$MODE" == "RED" ]; then
    echo "[*] Installing Red Team (Attacker) tools..." >> "$LOG_FILE"
    apt-get update
    apt-get install -y nmap aircrack-ng bettercap python3-pip git screen tshark >> "$LOG_FILE" 2>&1
    # Add P4wnP1-style gadget scripts if needed
elif [ "$MODE" == "BLUE" ]; then
    echo "[*] Installing Blue Team (Defender) tools..." >> "$LOG_FILE"
    apt-get update
    apt-get install -y fail2ban iptables-persistent tcpdump snort >> "$LOG_FILE" 2>&1
    # Configure basic monitoring/alerting
fi

# 5. Set up Web Terminal (TTYD)
echo "[*] Setting up Web Terminal for remote access..." >> "$LOG_FILE"
wget https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.armhf -O /usr/local/bin/ttyd
chmod +x /usr/local/bin/ttyd

cat << 'EOF' > /etc/systemd/system/ttyd.service
[Unit]
Description=Web Terminal
After=network.target

[Service]
ExecStart=/usr/local/bin/ttyd -p 8080 login
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl enable ttyd

echo "[*] Setup complete! Mode: $MODE" >> "$LOG_FILE"
echo "Access: http://<ip>:9090 (Cockpit) | http://<ip>:8080 (Terminal)" >> "$LOG_FILE"
