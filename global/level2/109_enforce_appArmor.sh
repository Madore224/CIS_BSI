#!/bin/bash

echo "[+] Enforce profiles AppArmor..."

if dpkg -s apparmor-profiles >/dev/null 2>&1; then
	aa-enforce /etc/apparmor.d/*
else
	    package="apparmor-profiles"
    	apt-get install -y "$package" >/dev/null 2>&1
    	if [ $? -eq 0 ]; then
		aa-enforce /etc/apparmor.d/*
	else
	    echo "[+] Erreur lors de l'installation du package $package."
	fi
fi