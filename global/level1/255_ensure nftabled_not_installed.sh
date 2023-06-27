#!/bin/bash

echo "[+] ensure nftables is not installed"
# Verify if nftables is installed
if dpkg -s nftables >/dev/null 2>&1; then
  echo "nftables is installed. Removing..."
  apt purge -y nftables
else
  echo ""
fi

