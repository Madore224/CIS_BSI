#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 92
echo -e "[+]$green Ensure permissions on bootloader config are configured $endcolor"
if [[ -f "/boot/grub/grub.cfg" ]]
then
	echo -e "[+]$green /boot/grub/grub.cfg permissions modified $endcolor"
	chown root:root /boot/grub/grub.cfg
	chmod og-rwx /boot/grub/grub.cfg
fi
