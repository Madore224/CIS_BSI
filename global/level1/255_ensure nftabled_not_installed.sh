#!/bin/bash

echo "[+] ensure nftables is not installed"
# Verify if nftables is installed
if dpkg -s nftables >/dev/null 2>&1; then
  echo "[+] nftables installation"
  apt purge -y nftables >/dev/null 2>&1
else
  echo ""
fi

