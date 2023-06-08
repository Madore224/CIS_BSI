#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"


#page 216
if [ "$(dpkg -s ufw | grep 'not installed' > /dev/null 2>&1)" != "" ]
then
	echo -e "[+]$green Install ufw $endcolor"
	apt install -y ufw > /dev/null 2>&1
fi
