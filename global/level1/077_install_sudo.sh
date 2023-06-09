#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 77
echo -e "[+]$green Check if sudo is installed $endcolor"
if [ "$(dpkg -s sudo | grep 'not installed' > /dev/null 2>&1)" != "" ]
then
	echo -e "[+]$green Install sudo $endcolor"
	apt install -y sudo > /dev/null 2>&1
fi
