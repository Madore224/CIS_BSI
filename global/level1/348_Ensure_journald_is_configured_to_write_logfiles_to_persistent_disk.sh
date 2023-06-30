#!/bin/bash

config_file="/etc/systemd/journald.conf"

# Check if Storage is set to persistent
storage_config=$(grep -e '^Storage=' "$config_file" | awk -F= '{print $2}')

if [[ "$storage_config" != "persistent" ]]; then
  echo "Logs are not persisted to disk in journald.conf. Modifying the configuration..."
  
  # Add 'Storage=persistent' line to enable persistent storage
  echo "Storage=persistent" >> "$config_file"
  
  echo "Logs are now persisted to disk in journald.conf."
else
  echo "Logs are already persisted to disk in journald.conf."
fi

