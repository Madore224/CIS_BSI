#!/bin/bash

echo "[+] Enforce profiles AppArmor..."

if dpkg -s apparmor-profiles >/dev/null 2>&1; then
	aa-enforce /etc/apparmor.d/* >/dev/null 2>&1
else
	package="apparmor-profiles"
    	apt install -y "$package" >/dev/null 2>&1
    	if [ $? -eq 0 ]; then
		aa-enforce /etc/apparmor.d/* >/dev/null 2>&1
	else
		echo "[+] Erreur lors de l'installation du package $package."
	fi
fi
