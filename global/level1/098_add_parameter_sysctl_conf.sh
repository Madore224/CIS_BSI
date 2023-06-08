#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 98
if [[ "$(grep 'kernel\.randomize_va_space' /etc/sysctl.conf /etc/sysctl.d/*)" == "" ]]
then
	echo -e "[+]$green Add parameter to /etc/sysctl.conf $endcolor"
	echo "kernel.randomize_va_space" = 2 >> /etc/sysctl.conf
	sysctl -w kernel.randomize_va_space=2 > /dev/null 2>&1
fi
