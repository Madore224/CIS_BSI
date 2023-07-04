#!/bin/env bash

#page 222

echo "[+] Ensure outbound connection are configured"
output=$(ufw status numbered)

if [[ ! "$output" =~ OUT ]]; then
  # Si aucune ligne ne contient "OUT", exécuter la commande "ufw allow out on all"
  ufw allow out on all > /dev/null 2>&1
fi
