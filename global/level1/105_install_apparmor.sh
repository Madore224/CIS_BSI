#!/bin/bash

#page 105
echo -e "[+] Check if apparmor is installed "
if [ "$(dpkg-query -l | grep 'apparmor-utils')" == "" ]
then
	echo -e "[+] Install apparmor & apparmor-utils "
	apt install -y apparmor > /dev/null 2>&1
	apt install -y apparmor-utils > /dev/null 2>&1
fi

