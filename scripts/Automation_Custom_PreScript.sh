#!/bin/bash
# Pi-Zero-Hybrid-Toolkit: Pre-Networking Connectivity Script
# This script runs BEFORE networking is up on first boot.

LOG_FILE="/boot/connectivity.log"
echo "--- Connectivity Setup Started: $(date) ---" > "$LOG_FILE"

# 1. Self-Healing Network Service
echo "[*] Creating self-healing network service..." >> "$LOG_FILE"
cat << 'EOF' > /etc/systemd/system/wifi-monitor.sh
#!/bin/bash
while true; do
    if ! ping -c 1 8.8.8.8 > /dev/null 2>&1; then
        echo "$(date): Network down, attempting reconnect..." >> /boot/connectivity.log
        ifconfig wlan0 down
        sleep 5
        ifconfig wlan0 up
        sleep 30
    fi
    # Write current IP to boot partition for easy discovery
    ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1 > /boot/my_ip.txt
    sleep 60
done
EOF
chmod +x /etc/systemd/system/wifi-monitor.sh

cat << 'EOF' > /etc/systemd/system/wifi-monitor.service
[Unit]
Description=WiFi Monitor and Self-Healer
After=network.target

[Service]
ExecStart=/etc/systemd/system/wifi-monitor.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# 2. IP Discovery via LED (Blink pattern)
echo "[*] Setting up LED blink for IP discovery..." >> "$LOG_FILE"
cat << 'EOF' > /etc/network/if-up.d/blink-ip
#!/bin/bash
if [ "$IFACE" = "wlan0" ]; then
    for i in {1..10}; do
        echo 1 > /sys/class/leds/led0/brightness
        sleep 0.1
        echo 0 > /sys/class/leds/led0/brightness
        sleep 0.1
    done
fi
EOF
chmod +x /etc/network/if-up.d/blink-ip

echo "[*] Connectivity setup finished." >> "$LOG_FILE"
