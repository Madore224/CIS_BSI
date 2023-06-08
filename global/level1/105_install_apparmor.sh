#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 105
if [ "$(dpkg-query -l | grep 'apparmor')" == "" ]
then
	echo -e "[+]$green Install apparmor $endcolor"
	apt install -y apparmor > /dev/null 2>&1
fi

