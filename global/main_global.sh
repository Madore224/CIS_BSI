#!/bin/bash

echo "Execution script global"

green="\033[32m" #couleur texte
red="\033[31m" #couleur texte
endcolor="\033[0m" #fin couleur texte
BAR="▰ ▰ ▰ ▰ ▰ ▰ ▰ ▰ ▰ ▰ " #progress bar

nb_tour=0 #nombre de tour
nb_scripts=$(($(ls -1 global/level2/*.sh | wc -l)*2)) #CHEMIN A MODIFIER (nombre de scripts)

# Chemin vers le dossier contenant les scripts de niveau 2
script_level2="global/level2" #(liste les scripts)


for fichierLv2 in "$script_level2"/*
do
  # Vérifier si fichier existant
  ((nb_tour=nb_tour+2))
  echo -ne "\r$green${BAR:0:$((nb_tour*20/nb_scripts))}$endcolor" $(( $nb_tour * 100/ $nb_scripts ))"%\n"
  if [ -f "$fichierLv2" ]; then
    # Exécuter le script
    bash "$fichierLv2"
    sleep 5
  else
    echo "Erreur not file found"
  fi
 
done

