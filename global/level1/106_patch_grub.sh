#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 106
echo -e "[+]$green Ensure AppArmor is enabled in the bootloader configuration $endcolor"
if [[ "$(diff /etc/default/grub /global/level1/patch_files/grub)" != "" ]]
then
	echo -e "[+]$green Patching /etc/default/grub $endcolor"
	diff /etc/default/grub /global/level1/patch_files/grub > patch.patch
    patch /etc/default/grub -i patch.patch > /dev/null 2>&1
    rm patch.patch /dev/null 2>&1
	update-grub /dev/null 2>&1
fi
