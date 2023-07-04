#!/bin/env bash

echo "[+] Ensure cron daemon is anabled and running"
# Check if cron is enabled
if ! systemctl is-enabled cron &> /dev/null; then
  echo ""
  
  # Enable and start cron
  systemctl --now enable cron
  
  echo ""
else
  # Check if cron is running
  if systemctl status cron | grep -q 'Active: active (running)'; then
    echo ""
  else
    echo ""
  fi
fi

