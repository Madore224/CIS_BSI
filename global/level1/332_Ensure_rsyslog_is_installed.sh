#!/bin/bash

echo "[+] Ensure rsyslog is installed"

# Check if either rsyslog or syslog-ng is installed
if dpkg -s rsyslog 2>/dev/null | grep -q "Status: install ok installed"; then
  echo ""
elif dpkg -s syslog-ng 2>/dev/null | grep -q "Status: install ok installed"; then
  echo "syslog-ng is already installed."
else
  echo ""
  apt install rsyslog -y >/dev/null 2>&1
fi

