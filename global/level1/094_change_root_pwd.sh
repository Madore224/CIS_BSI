#!/bin/bash

#page 94
echo -e "[+] Ensure authentication required for single user mode"
if [ "$(grep '^root:[*\!]:' /etc/shadow)" != "" ]
then
	echo -e "[+] Change root password"
	passwd root
fi
