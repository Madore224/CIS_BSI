#!/bin/bash


#page 221

status=$(ufw status verbose | grep "État" | awk '{print $NF}')

if [[ $status == "inactif" ]]; then
  ufw allow in on lo
  ufw allow out from lo
  ufw deny in from 127.0.0.0/8
  ufw deny in from ::1
fi

#page 222

output=$(ufw status numbered)

if [[ ! "$output" =~ OUT ]]; then
  # Si aucune ligne ne contient "OUT", exécuter la commande "ufw allow out on all"
  ufw allow out on all
fi

#page 225

status=$(ufw status verbose)

# Vérifie si l'arrivée est refusée ou rejetée
if echo "$status" | grep -q "Incoming: .* (deny|reject)"; then
  echo "L'arrivée est correctement configurée."
else
  echo "L'arrivée n'est pas correctement configurée. Configuration en cours..."
  ufw default deny incoming
  echo "Configuration de l'arrivée terminée."
fi

# Vérifie si le départ est refusé ou rejeté
if echo "$status" | grep -q "Outgoing: .* (deny|reject)"; then
  echo "Le départ est correctement configuré."
else
  echo "Le départ n'est pas correctement configuré. Configuration en cours..."
  ufw default deny outgoing
  echo "Configuration du départ terminée."
fi

# Vérifie si les directions routées sont refusées ou rejetées
if echo "$status" | grep -q "routed: .* (deny|reject)"; then
  echo "Les directions routées sont correctement configurées."
else
  echo "Les directions routées ne sont pas correctement configurées. Configuration en cours..."
  ufw default deny routed
  echo "Configuration des directions routées terminée."
fi

#Page 232

if dpkg-query -s nftables | grep 'Status: install ok installed' > /dev/null 2>&1; then
    echo "nftables is already installed"
else
    # If nftables is not installed, install it using apt
    echo "nftables is not installed, installing now..."
    sudo apt update
    sudo apt install nftables
    echo "nftables has been installed"
fi

# Exécuter la commande dpkg-query et la stocker dans une variable
status=$(dpkg-query -s nftables | grep 'Status: install ok installed')

# Vérifier si la commande renvoie "Status: install ok installed"
if [[ $status != "Status: install ok installed" ]]; then
    # Si la commande ne renvoie pas "Status: install ok installed", exécuter "apt install nftables"
    apt install nftables
fi

# Exécuter la commande dpkg-query et stocker le résultat dans une variable
status=$(dpkg-query -s ufw)

# Vérifier si le package 'ufw' n'est pas installé
if [[ $status == *"package 'ufw' is not installed and no information is available"* ]]; then
    echo "ufw is not installed"
    exit 0
fi

# Si le package 'ufw' est installé, lancer la commande "apt purge ufw"
echo "ufw is installed. Purging..."
apt purge ufw

# Vérifier si ufw est activé
ufw_status=$(ufw status | grep "Status" | awk '{print $2}')
if [[ $ufw_status == "active" ]]; then
    # Si ufw est activé, désactiver
    echo "ufw is active. Disabling..."
    ufw disable
fi

# Afficher le statut final de ufw
ufw status verbose

# Exécuter la commande iptables et stocker le résultat dans une variable
iptables_status=$(iptables -L)

# Exécuter la commande ip6tables et stocker le résultat dans une variable
ip6tables_status=$(ip6tables -L)

# Vérifier si des règles sont retournées pour les deux commandes
if [[ $iptables_status != *"Chain"* ]] && [[ $ip6tables_status != *"Chain"* ]]; then
    # Si aucune règle n'est retournée, afficher un message et quitter le script
    echo "No rules found in iptables and ip6tables"
    exit 0
fi

# Si des règles sont retournées pour les deux commandes, purger les règles
echo "Rules found in iptables and ip6tables. Flushing..."