#!/bin/bash

#Page 231

echo "[+] Ensure nftables is installed"

sudo apt update >/dev/null 2>&1
sudo apt install nftables >/dev/null 2>&1
