#!/bin/bash

echo "Execution script global"

# Chemin vers le dossier contenant les scripts de niveau 2
script_level2="./level2"

for fichierLv2 in $script_level2/*; do
  # Vérifier si le fichier est un script exécutable
  if [[ -x "$fichierLv2" && -f "$fichierLv2" ]]; then
    # Exécuter le script
    echo "$fichierLv2"
    bash "$fichierLv2"
  fi
done
