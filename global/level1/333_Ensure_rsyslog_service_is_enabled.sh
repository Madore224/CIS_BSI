#!/bin/bash

echo "[+] Ensure rsyslog service is enabled"

# Check if rsyslog is enabled
enabled=$(systemctl is-enabled rsyslog)

if [[ "$enabled" == "enabled" ]]; then
  echo ""
else
  echo ""
  systemctl --now enable rsyslog
fi

