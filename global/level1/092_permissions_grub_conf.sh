#!/bin/bash

#page 92
echo -e "[+] Ensure permissions on bootloader config are configured"
if [[ -f "/boot/grub/grub.cfg" ]]
then
	echo -e "[+] /boot/grub/grub.cfg permissions modified"
	chown root:root /boot/grub/grub.cfg
	chmod og-rwx /boot/grub/grub.cfg
fi
