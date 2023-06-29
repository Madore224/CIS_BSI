#!/bin/bash

#page 85
echo -e "[+] Check if a crontab for Aidecheck exist"
if [[ "$(crontab -u root -l | grep aide)" == "" ]]
then
	echo -e "[+] Add a crontab to schedule Aidecheck"
	(crontab -l 2>/dev/null; echo "0 5 * * * /usr/bin/aide.wrapper --config /etc/aide/aide.conf --check") | crontab - > /dev/null 2>&1
fi
