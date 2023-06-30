#!/bin/bash

#page 226 
status=$(ufw status verbose)

# Vérifie si l'arrivée est refusée ou rejetée
if echo "$status" | grep -q "Incoming: .* (deny|reject)"; then
  echo ""
else
  ufw default deny incoming
fi

# Vérifie si le départ est refusé ou rejeté
if echo "$status" | grep -q "Outgoing: .* (deny|reject)"; then
  echo ""
else
  ufw default deny outgoing
fi

# Vérifie si les directions routées sont refusées ou rejetées
if echo "$status" | grep -q "routed: .* (deny|reject)"; then
  echo ""
else
  ufw default deny routed
fi
