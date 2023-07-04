#!/bin/bash

echo "[+] Ensure iptables package installed"

# Verify if iptables and iptables-persistent are installed
if ! apt list --installed iptables iptables-persistent | grep -qE 'iptables|iptables-persistent'; then
  apt-get update
  apt-get install -y iptables iptables-persistent 
else
  echo ""
fi

