#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 124
echo -e "[+]$green Ensure updates, patches, and additional security software are installed $endcolor"
#if [ "$(dpkg-query -l | grep 'upgrade')" != "" ]
#then
#	echo -e "[+]$green Upgrading $endcolor"
#	apt -y install upgrade > /dev/null 2>&1
#fi
