#!/bin/bash


#page 221

echo "[+] Ensure loopback is configured"

status=$(ufw status verbose | grep "État" | awk '{print $NF}')

if [[ $status == "inactif" ]]; then
  ufw allow in on lo > /dev/null 2>&1
  ufw allow out from lo > /dev/null 2>&1
  ufw deny in from 127.0.0.0/8 > /dev/null 2>&1
  ufw deny in from ::1 > /dev/null 2>&1
fi
