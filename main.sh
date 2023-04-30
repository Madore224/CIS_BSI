#!/bin/bash

echo "Bonjour !"

sudo su

# chemin vers le script à exécuter
script_global="global/main_global.sh"
script_workstation="workstation/main_workstation.sh"
script_server="server/main_server.sh"

echo "Veuillez choisir une option d'installation (écrire 1 ou 2) :"
echo "	1. Installation serveur"
echo "	2. Installation workstation"
read choix

# Vérifier la réponse de l'utilisateur
if [[ $choix == "1" ]]; then
	echo "Vous avez choisi l'option A."
elif [[ $choix == "2" ]]; then
 	# vérifier si le fichier existe
	if [ -f $script_global ]; then
	  # exécuter le script main_global
	  bash $script_global
	  
	  if [ -f $script_workstation ]; then
	  	# exécuter le script main_workstation
	  	bash $script_workstation
	  else
	  	echo "Erreur: le fichier $script_workstation n'existe pas"
	  fi
	  
	else
	  echo "Erreur: le fichier $script_global n'existe pas"
	fi
else
 	echo "Choix invalide. Veuillez choisir entre l'option 1 ou l'option 2."
fi

