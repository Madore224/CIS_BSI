#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 106
echo -e "[+] Ensure AppArmor is enabled in the bootloader configuration"
if [[ "$(cat /etc/default/grub | grep 'GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor')" == "" ]]
then
	echo -e "[+] Patching /etc/default/grub"
	echo 'GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"' >> /etc/default/grub
	update-grub > /dev/null 2>&1
fi
