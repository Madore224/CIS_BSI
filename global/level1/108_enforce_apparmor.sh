#!/bin/bash

#page 105
echo -e "[+] Check if apparmor profiles are enforced or complain mode "
if [ "$(dpkg-query -l | grep 'apparmor')" != "" ]
then
	echo "1- Enforce profiles  2- Complain mode profiles"
	read -p "Mode:" mode
	if [[ $mode == 1 ]]
	then
		echo -e "[+] Enforce profiles"
		aa-enforce /etc/apparmor.d/* > /dev/null 2>&1
	fi
	if [[ $mode == 2 ]]
	then
		echo -e "[+] Complain mode profiles"
		aa-complain /etc/apparmor.d/* > /dev/null 2>&1
	fi
fi