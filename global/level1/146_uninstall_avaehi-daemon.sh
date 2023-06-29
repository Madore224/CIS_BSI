#!/bin/bash

#page 146
echo -e "[+] Check if avahi-daemon is installed "
command=$(dpkg-query -l)
if echo $command | grep -q 'avahi-daemon'
then
	echo -e "[+] Uninstall avahi-daemon "
	systemctl stop avahi-daemon.service > /dev/null 2>&1
	systemctl stop avahi-daemon.socket > /dev/null 2>&1
	apt purge avahi-daemon > /dev/null 2>&1
fi
