#!/bin/bash

#page 77
echo -e "[+] Check if sudo is installed"
if [ "$(dpkg -s sudo | grep 'not installed' > /dev/null 2>&1)" != "" ]
then
	echo -e "[+] Install sudo"
	apt install -y sudo > /dev/null 2>&1
fi
