#!/bin/bash

echo "[+] Ensure uncompilated firewall_is_not_installed"

# Verify if ufw is installed
if dpkg-query -s ufw >/dev/null 2>&1; then
  echo ""

  # Check ufw status
  ufw_status=$(ufw status)
  
  # Check if ufw service is masked
  ufw_service_status=$(systemctl is-enabled ufw)
  
  # Disable or remove ufw based on service status
  if [[ "$ufw_service_status" == "masked" ]]; then
    echo ""
  else
    ufw disable
    echo ""
  fi
else
  echo ""
fi

