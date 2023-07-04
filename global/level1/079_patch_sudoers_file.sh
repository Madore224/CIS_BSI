#!/bin/bash

#page 79 and 81
echo -e "[+] Ensure sudo commands use pty"
command=$(cat /etc/sudoers)
if ! echo $command | grep -q 'Defaults' | grep -q 'use_pty'
then
	echo -e "[+] Adding 'Defaults use_pty' to /etc/sudoers"
 	mkdir /etc/sudoers.d > /dev/null 2>&1
  	touch /etc/sudoers.d/cis_auto_rules > /dev/null 2>&1
	echo "Defaults use_pty" >> /etc/sudoers.d/cis_auto_rules
fi
