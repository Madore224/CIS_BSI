#!/bin/env bash

echo "[+] Ensure cron daemon is anabled and running"
# Check if cron is enabled
if ! systemctl is-enabled cron &> /dev/null; then
  echo "Cron is not enabled. Enabling and starting cron..."
  
  # Enable and start cron
  systemctl --now enable cron
  
  echo "Cron has been enabled and started."
else
  # Check if cron is running
  if systemctl status cron | grep -q 'Active: active (running)'; then
    echo "Cron is enabled and running."
  else
    echo "Cron is enabled but not running."
  fi
fi

