#!/bin/bash

echo "[+] Ensure journald is configured"


config_file="/etc/systemd/journald.conf"

# Check if Compress is set to yes
compress_enabled=$(grep -e '^Compress=' "$config_file" | awk -F= '{print $2}')

if [[ "$compress_enabled" != "yes" ]]; then
  echo ""
  
  # Add 'Compress=yes' line to enable compression
  echo ""
  
  echo ""
else
  echo ""
fi

