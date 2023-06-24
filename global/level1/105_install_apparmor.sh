#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 105
echo -e "[+]$green Check if apparmor is installed $endcolor"
if [ "$(dpkg-query -l | grep 'apparmor')" == "" ]
then
	echo -e "[+]$green Install apparmor & apparmor-utils $endcolor"
	apt install -y apparmor > /dev/null 2>&1
	apt install -y apparmor-utils > /dev/null 2>&1
fi

