#!/bin/bash

#Page 231

echo "Ensure nftables are installed"

if dpkg-query -s nftables | grep 'Status: install ok installed' > /dev/null 2>&1; then
    
else
    # If nftables is not installed, install it using apt
    
    sudo apt update
    sudo apt install nftables
    
fi

# Exécuter la commande dpkg-query et la stocker dans une variable
status=$(dpkg-query -s nftables | grep 'Status: install ok installed')

# Vérifier si la commande renvoie "Status: install ok installed"
if [[ $status != "Status: install ok installed" ]]; then
    # Si la commande ne renvoie pas "Status: install ok installed", exécuter "apt install nftables"
    apt install nftables
fi
