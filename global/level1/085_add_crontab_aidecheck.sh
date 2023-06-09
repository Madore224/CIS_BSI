#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"


#page 85
echo -e "[+]$green Check if a crontab for Aidecheck exist $endcolor"
if [[ "$(crontab -u root -l | grep aide)" == "" ]]
then
	echo -e "[+]$green Add a crontab to schedule Aidecheck $endcolor"
	(crontab -l 2>/dev/null; echo "0 5 * * * /usr/bin/aide.wrapper --config /etc/aide/aide.conf --check") | crontab - > /dev/null 2>&1
fi
