#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 83
echo -e "[+]$green Check if aide & aide-common are installed $endcolor"
command=$(dpkg-query -l)
if ! echo $command | grep -q 'aide'
then
	if ! echo $command | grep -q ' aide-common'
	then
		echo -e "[+]$green Install aide & aide-common $endcolor"
		apt install -y aide aide-common > /dev/null 2>&1
		aideinit > /dev/null 2>&1
		mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
	fi
fi
