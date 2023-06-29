#!/bin/bash

#page 123
echo -e "[+] Ensure permissions on /etc/issue.net are configured"
if [[ -f "/etc/issue.net" ]]
then
	echo -e "[+] /etc/issue.net permissions modified"
	chown root:root /etc/issue.net > /dev/null 2>&1
	chmod u-x,go-wx /etc/issue.net > /dev/null 2>&1
fi
