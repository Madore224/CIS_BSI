#!/bin/bash

echo "[+] Ensure nftables are enabled" 

# Verify if nftables service is enabled
nftables_enabled=$(systemctl is-enabled nftables)

if [ "$nftables_enabled" != "enabled" ]; then
  # Enable nftables service using "systemctl enable"
  systemctl enable nftables
else
  echo ""
fi

