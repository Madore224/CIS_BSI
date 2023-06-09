#!/bin/bash

#Fiable 98 %

echo "[+] Delete Cups..."

if dpkg -s cups >/dev/null 2>&1; then
	echo "Cups is installed."
	while true; do
	
		echo "Votre système aura-t-il besoin d'imprimer des travaux ? (yes/no)"
		
		read choix
		
		if [ "$choix" = "no" ]; then
			echo "You choose to delete Cups..."
			sudo apt purge cups
			echo "Cups now is delete."
			break
		elif [ "$choix" = "yes" ]; then
			echo "Cups is safe."
			break
		else
			echo "Invalid choose"
		fi
	done
fi
