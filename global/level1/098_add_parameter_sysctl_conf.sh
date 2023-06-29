#!/bin/bash

#page 98
echo -e "[+] Ensure address space layout randomization (ASLR) is enabled"
if [[ "$(grep 'kernel\.randomize_va_space' /etc/sysctl.conf /etc/sysctl.d/*)" == "" ]]
then
	echo -e "[+] Add parameter to /etc/sysctl.conf"
	echo "kernel.randomize_va_space" = 2 >> /etc/sysctl.conf
	sysctl -w kernel.randomize_va_space=2 > /dev/null 2>&1
fi
