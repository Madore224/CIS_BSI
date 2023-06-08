#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 123
if [[ -f "/etc/issue.net" ]]
then
	echo -e "[+]$green /etc/issue.net permissions modified $endcolor"
	chown root:root /etc/issue.net > /dev/null 2>&1
	chmod u-x,go-wx /etc/issue.net > /dev/null 2>&1
fi
