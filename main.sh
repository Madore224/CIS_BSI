#!/bin/bash

echo "Bonjour ! "

# Vérifier si l'utilisateur a les privilèges sudo
if sudo -n true 2>/dev/null; then
	echo "L'utilisateur a les privilèges sudo."
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
		if [ -f $script_global ]; then
		  bash $script_global
		  
		  if [ -f $script_server ]; then
		  	bash $script_server
		  else
		  	echo "Erreur: le fichier $script_server n'existe pas"
		  fi
		else
		  echo "Erreur: le fichier $script_global n'existe pas"
		fi
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
else
    echo "L'utilisateur n'a pas les privilèges sudo."
    echo "Exécuter la commande 'sudo su' pour passer root puis relancer le programme."
fi

