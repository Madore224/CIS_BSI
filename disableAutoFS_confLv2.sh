#!/bin/bash

echo -e "START disabled autofs...\n"

# Si autoFS est install renvoie 0 (signifie succès). Sinon autoFS n'est pas intallé.
if dpkg -s autofs >/dev/null 2>&1; then
	while true; do

        # Demande à l'utilisateur de faire un choix
		echo "AutoFs is installed."
		echo "1. Disabled AutoFS"
		echo "2. Delete the package AutoFS"
		
		read choix
		
        #Disabled AutoFS
		if [ "$choix" = "1" ]; then
			echo "You choose to desable AutoFS..."
			sudo systemctl --now mask autofs
			echo "AutoFs now is disabled."
			break
        #Delete AutoFS
		elif [ "$choix" = "2" ]; then
			echo "You choose to delete the package AutoFS."
			sudo apt purge autofs
			break
		else
			echo "Invalid choose"
		fi
	done
else
	echo "Autofs is not installed."
fi