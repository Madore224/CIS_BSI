#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 146
echo -e "[+]$green Check if avahi-daemon is installed $endcolor"
command=$(dpkg-query -l)
if echo $command | grep -q 'avahi-daemon'
then
	echo -e "[+]$green Uninstall avahi-daemon $endcolor"
	systemctl stop avahi-daemon.service > /dev/null 2>&1
	systemctl stop avahi-daemon.socket > /dev/null 2>&1
	apt purge avahi-daemon > /dev/null 2>&1
fi
