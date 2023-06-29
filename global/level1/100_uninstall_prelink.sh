#!/bin/bash

#page 100
echo -e "[+] Check if Prelink is installed"
if [[ "$(dpkg-query -l | grep 'prelink')" != "" ]]
then
	echo -e "[+] Uninstall Prelink"
	prelink -ua > /dev/null 2>&1
	apt purge prelink > /dev/null 2>&1
fi
