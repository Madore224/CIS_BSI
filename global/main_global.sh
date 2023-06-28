#!/bin/bash

echo -e "\n***********************"
echo -e "EXECUTION SCRIPT GLOBAL"
echo -e "***********************\n"

green="\033[32m" #couleur texte
red="\033[31m" #couleur texte
endcolor="\033[0m" #fin couleur texte
BAR="▰ ▰ ▰ ▰ ▰ ▰ ▰ ▰ ▰ ▰ " #progress bar

nb_tour=0 #nombre de tour
nb_scripts_lv1=$(($(ls -1 global/level1/*.sh | wc -l)*2)) #CHEMIN A MODIFIER (nombre de scripts)
nb_scripts_lv2=$(($(ls -1 global/level2/*.sh | wc -l)*2)) #CHEMIN A MODIFIER (nombre de scripts)

# Chemin vers le dossier contenant les scripts de niveau 1 et 2
script_level1="global/level1" #(liste les scripts)
script_level2="global/level2" #(liste les scripts)


for fichierLv1 in "$script_level1"/*
do
  	# Vérifier si fichier existant
	((nb_tour=nb_tour+2))
	echo -ne "\r$green${BAR:0:$((nb_tour*20/nb_scripts_lv1))}$endcolor" $(( $nb_tour * 100/ $nb_scripts_lv1 ))"%\n"
	if [ -f "$fichierLv1" ]; then
		# Exécuter le script
		bash "$fichierLv1"
		sleep 5
	else
		echo "Erreur not file found"
	fi
 
done

nb_tour=0
for fichierLv2 in "$script_level2"/*
do
  	# Vérifier si fichier existant
	((nb_tour=nb_tour+2))
	echo -ne "\r$green${BAR:0:$((nb_tour*20/nb_scripts_lv2))}$endcolor" $(( $nb_tour * 100/ $nb_scripts_lv2 ))"%\n"
	if [ -f "$fichierLv2" ]; then
		# Exécuter le script
		bash "$fichierLv2"
		sleep 5
	else
		echo "Erreur not file found"
	fi
done

/etc/init.d/auditd restart >/dev/null 2>&1
