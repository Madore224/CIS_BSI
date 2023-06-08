#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 124
if [ "$(dpkg-query -l | grep 'upgrade')" != "" ]
then
	echo -e "[+]$green Install upgrade $endcolor"
	apt -y install upgrade > /dev/null 2>&1
fi


echo -e "[+]$green Upgrading $endcolor"
apt -y upgrade > /dev/null 2>&1
