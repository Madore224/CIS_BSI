#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 124
echo -e "[+]$green Ensure updates, patches, and additional security software are installed $endcolor"
command=$(apt -s upgrade)
if echo $command | grep -q ''
then
	echo -e "[+]$green Upgrading $endcolor"
	apt -y upgrade > /dev/null 2>&1
fi
