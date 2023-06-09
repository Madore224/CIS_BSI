#!/bin/bash

if dpkg -s apparmor-utils >/dev/null 2>&1; then
	echo "[+] Apparmor-utils est déjà installé."
else
    	apt-get install -y "$package" >/dev/null 2>&1
    	if [ $? -eq 0 ]; then
		echo "[+] Package $package installé avec succès."
		aa-enforce /etc/apparmor.d/*
	else
	    echo "[+] Erreur lors de l'installation du package $package."
	fi	
fi
