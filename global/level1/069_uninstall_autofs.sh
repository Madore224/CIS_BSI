#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 69
echo -e "[+]$green Check if autofs is installed $endcolor"
command=$(dpkg-query -l)
if echo $command | grep -q "autofs"
then
	echo -e "[+]$green Uninstall autofs $endcolor"
	apt purge autofs > /dev/null 2>&1
fi
