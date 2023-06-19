#!/bin/bash


#page 221

echo "Ensure loopback is configured"

status=$(ufw status verbose | grep "État" | awk '{print $NF}')

if [[ $status == "inactif" ]]; then
  ufw allow in on lo
  ufw allow out from lo
  ufw deny in from 127.0.0.0/8
  ufw deny in from ::1
fi
