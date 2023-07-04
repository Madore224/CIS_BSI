#!/bin/bash

echo "[+] Ensure logrotate assigns appropriate permission"

config_file="/etc/logrotate.conf"

# Run command to check create lines in logrotate.conf
output=$(grep -E "^\s*create\s+\S+" "$config_file" | grep -E -v "\s(0)?[0-6][04]0\s")

# Check if any lines are returned
if [[ -n "$output" ]]; then
  echo ""
  
  # Update create lines to read 0640 or more restrictive
  sed -i 's/^\(\s*create\s\+\)\S\+/\10640/' "$config_file"
  
  echo ""
else
  echo ""
fi

