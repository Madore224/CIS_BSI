#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 100
if [[ "$(dpkg-query -l | grep 'prelink')" != "" ]]
then
	echo -e "[+]$green Uninstall Prelink $endcolor"
	prelink -ua > /dev/null 2>&1
	apt purge prelink > /dev/null 2>&1
fi
