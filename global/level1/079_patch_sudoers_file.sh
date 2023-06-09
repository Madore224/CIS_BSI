#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 79 and 81
echo -e "[+]$green Ensure sudo commands use pty $endcolor"
if [[ "$(diff /etc/sudoers patch_files/sudoers)" != "" ]]
then
	echo -e "[+]$green Patching /etc/sudoers $endcolor"
	diff /etc/sudoers patch_files/sudoers > patch.patch
	patch /etc/sudoers -i patch.patch > /dev/null 2>&1
	rm patch.patch > /dev/null 2>&1
fi
