#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 120
echo -e "[+]$green Ensure permissions on /etc/motd are configured $endcolor"
if [[ -d "/etc/motd" ]]
then
	echo -e "[+]$green /etc/motd permissions modified $endcolor"
	chown root:root /etc/motd > /dev/null 2>&1
	chmod u-x,go-wx /etc/motd > /dev/null 2>&1
fi
