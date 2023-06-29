#!/bin/bash

#page 124
echo -e "[+] Ensure updates, patches, and additional security software are installed "
command=$(apt -s upgrade)
if echo $command | grep -q ''
then
	echo -e "[+] Upgrading "
	apt -y upgrade > /dev/null 2>&1
fi
