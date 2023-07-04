#!/bin/bash

echo "[+] Ensure journald is configured to write logfiles to persistent permissions"

config_file="/etc/systemd/journald.conf"

# Check if Storage is set to persistent
storage_config=$(grep -e '^Storage=' "$config_file" | awk -F= '{print $2}')

if [[ "$storage_config" != "persistent" ]]; then
  echo ""
  
  # Add 'Storage=persistent' line to enable persistent storage
  echo "Storage=persistent" >> "$config_file"
  
  echo ""
else
  echo ""
fi

