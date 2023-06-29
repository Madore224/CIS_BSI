#!/bin/bash

#page 122
echo -e "[+] Ensure permissions on /etc/issue are configured "
if [[ -d "/etc/issue" ]]
then
	echo -e "[+] /etc/issue permissions modified"
	chown root:root /etc/issue > /dev/null 2>&1
	chmod u-x,go-wx /etc/issue > /dev/null 2>&1
fi
