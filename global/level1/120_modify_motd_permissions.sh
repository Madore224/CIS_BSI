#!/bin/bash

#page 120
echo -e "[+] Ensure permissions on /etc/motd are configured "
if [[ -d "/etc/motd" ]]
then
	echo -e "[+] /etc/motd permissions modified "
	chown root:root /etc/motd > /dev/null 2>&1
	chmod u-x,go-wx /etc/motd > /dev/null 2>&1
fi
