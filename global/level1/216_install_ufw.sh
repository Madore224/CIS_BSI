#!/bin/bash


#page 216
echo -e "[+] Check if ufw is installed "
if [ "$(dpkg -s ufw | grep 'not installed' > /dev/null 2>&1)" != "" ]
then
	echo -e "[+] Install ufw "
	apt install -y ufw > /dev/null 2>&1
fi
