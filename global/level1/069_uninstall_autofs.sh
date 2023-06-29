#!/bin/bash

#page 69
echo -e "[+] Check if autofs is installed"
command=$(dpkg-query -l)
if echo $command | grep -q "autofs"
then
	echo -e "[+] Uninstall autofs"
	apt purge autofs > /dev/null 2>&1
fi
