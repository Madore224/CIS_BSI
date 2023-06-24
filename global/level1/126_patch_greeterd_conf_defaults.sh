#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 126
echo -e "[+]$green Ensure GDM is removed or login is configured $endcolor"
if [[ "$(dpkg-query -l | grep 'gdm3')" != "" ]]
then
	echo -e "[+]$green Patching /etc/gdm3/greeter.dconf-defaults $endcolor"
	cp global/level1/patch_files/greeter.dconf-defaults /etc/gdm3/greeter.dconf-defaults > /dev/null 2&>1
	dpkg-reconfigure gdm3 > /dev/null 2>&1
fi
