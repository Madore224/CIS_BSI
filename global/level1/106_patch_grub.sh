#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 106
echo -e "[+] Ensure AppArmor is enabled in the bootloader configuration"
if [[ "$(diff /etc/default/grub global/level1/patch_files/grub)" != "" ]]
then
	echo -e "[+] Patching /etc/default/grub"
	diff /etc/default/grub global/level1/patch_files/grub > patch.patch
    patch /etc/default/grub -i patch.patch > /dev/null 2>&1
	update-grub > /dev/null 2>&1
fi
