#!/bin/bash

#Page 231

echo "[+] Ensure nftables are installed"

if dpkg-query -s nftables | grep 'Status: install ok installed' > /dev/null 2>&1; then
    echo ""
else
    # If nftables is not installed, install it using apt
    
    sudo apt update
    sudo apt install nftables >/dev/null 2>&1
    
fi

# Exécuter la commande dpkg-query et la stocker dans une variable
status=$(dpkg-query -s nftables | grep 'Status: install ok installed')

# Vérifier si la commande renvoie "Status: install ok installed"
if [[ $status != "Status: install ok installed" ]]; then
    
    apt install nftables
fi
