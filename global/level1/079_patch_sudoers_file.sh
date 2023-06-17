#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 79 and 81
echo -e "[+]$green Ensure sudo commands use pty $endcolor"
command=$(cat /etc/sudoers)
if ! echo $command | grep -q 'Defaults' | grep -q 'use_pty'
then
	echo -e "[+]$green Adding 'Defaults use_pty' to /etc/sudoers $endcolor"
	echo "Defaults use_pty" >> /etc/sudoers
fi
