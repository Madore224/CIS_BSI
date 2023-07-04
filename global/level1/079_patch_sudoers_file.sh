#!/bin/bash

#page 79 and 81
echo -e "[+] Ensure sudo commands use pty"
command=$(cat /etc/sudoers)
if ! echo $command | grep -q 'Defaults' | grep -q 'use_pty'
then
	echo -e "[+] Adding 'Defaults use_pty' to /etc/sudoers"
 	mkdir /etc/sudoers.d
  	touch /etc/sudoers.d/cis_auto_rules
   	echo "#includedir /etc/sudoers.d" >> /etc/sudoers
	echo "Defaults use_pty" >> /etc/sudoers.d/cis_auto_rules
fi
