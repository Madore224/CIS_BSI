#!/bin/bash

# page 235

echo "Ensure iptables are flushed"

# Afficher le statut final de ufw
ufw status verbose

# Exécuter la commande iptables et stocker le résultat dans une variable
iptables_status=$(iptables -L)

# Exécuter la commande ip6tables et stocker le résultat dans une variable
ip6tables_status=$(ip6tables -L)

# Vérifier si des règles sont retournées pour les deux commandes
if [[ $iptables_status != *"Chain"* ]] && [[ $ip6tables_status != *"Chain"* ]]; then
    # Si aucune règle n'est retournée, afficher un message et quitter le script
    exit 0
fi

# Si des règles sont retournées pour les deux commandes, purger les règles

iptables -F
ip6tables -F

