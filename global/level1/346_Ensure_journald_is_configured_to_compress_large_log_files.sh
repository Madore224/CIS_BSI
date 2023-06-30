#!/bin/bash

config_file="/etc/systemd/journald.conf"

# Check if Compress is set to yes
compress_enabled=$(grep -e '^Compress=' "$config_file" | awk -F= '{print $2}')

if [[ "$compress_enabled" != "yes" ]]; then
  echo "Compress is not enabled in journald.conf. Modifying the configuration..."
  
  # Add 'Compress=yes' line to enable compression
  echo "Compress=yes" >> "$config_file"
  
  echo "Compress has been enabled in journald.conf."
else
  echo "Compress is already enabled in journald.conf."
fi

