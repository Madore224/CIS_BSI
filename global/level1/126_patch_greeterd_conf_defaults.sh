#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 126
if [[ "$(dpkg-query -l | grep 'gdm3')" != "" ]]
then
	echo -e "[+]$green Patching /etc/gdm3/greeter.dconf-defaults $endcolor"
	diff /etc/gdm3/greeter.dconf-defaults patch_files/greeter.dconf-defaults > patch.patch
	patch /etc/gdm3/greeter.dconf-defaults -i patch.patch > /dev/null 2&>1
        rm patch.patch > /dev/null 2>&1
	dpkg-reconfigure gdm3 > /dev/null 2>&1
fi
