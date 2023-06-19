#!/bin/bash

#page 226 
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
