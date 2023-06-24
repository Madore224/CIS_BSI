#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 105
echo -e "[+]$green Check if apparmor profiles are enforced or complain mode $endcolor"
if [ "$(dpkg-query -l | grep 'apparmor')" != "" ]
then
	echo "1- Enforce profiles  2- Complain mode profiles"
	read -p "Mode:" mode
	if [[ $mode == 1 ]]
	then
		echo -e "[+]$green Enforce profiles $endcolor"
		aa-enforce /etc/apparmor.d/* > /dev/null 2>&1
	fi
	if [[ $mode == 2 ]]
	then
		echo -e "[+]$green Complain mode profiles $endcolor"
		aa-complain /etc/apparmor.d/* > /dev/null 2>&1
	fi
fi