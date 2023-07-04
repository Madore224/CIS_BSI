#!/bin/env bash

#page 233

echo "[+] Ensure uncompilated is not installed"

# Exécuter la commande dpkg-query et stocker le résultat dans une variable
status=$(dpkg-query -s ufw)

# Vérifier si le package 'ufw' n'est pas installé
if [[ $status == *"package 'ufw' is not installed and no information is available"* ]]; then
    exit 0
fi

# Si le package 'ufw' est installé, lancer la commande "apt purge ufw"
apt purge ufw >/dev/null 2>&1

# Vérifier si ufw est activé
ufw_status=$(ufw status | grep "Status" ) >/dev/null 2>&1
if [[ $ufw_status == "active" ]]; then
    # Si ufw est activé, désactiver
    ufw disable >/dev/null 2>&1
fi
