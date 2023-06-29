#!/bin/bash

#page 126
echo -e "[+] Ensure GDM is removed or login is configured "
if [[ "$(dpkg-query -l | grep 'gdm3')" != "" ]]
then
	echo -e "[+] Patching /etc/gdm3/greeter.dconf-defaults "
	cp global/level1/patch_files/greeter.dconf-defaults /etc/gdm3/greeter.dconf-defaults
	dpkg-reconfigure gdm3 > /dev/null 2>&1
fi
