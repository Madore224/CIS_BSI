#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 122
if [[ -d "/etc/issue" ]]
then
	echo -e "[+]$green /etc/issue permissions modified $endcolor"
	chown root:root /etc/issue > /dev/null 2>&1
	chmod u-x,go-wx /etc/issue > /dev/null 2>&1
fi
