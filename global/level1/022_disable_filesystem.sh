#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 22-32
for Module in "cramfs" "freevxfs" "jffs2" "hfs" "hfsplus" "udf" "vfat"
do
	required="install /bin/true "
	installstatus=$(modprobe -n -v $Module | grep -E "($Module|install)")
	if [ "$installstatus" != "$required" ]
	then
		touch /etc/modprobe.d/$Module.conf
		echo "install $Module /bin/true" > /etc/modprobe.d/$Module.conf
		rmmod $Module
	fi
	installstatus=$(modprobe -n -v $Module | grep -E "($Module|install)")
	if [ "$installstatus" == "$required" ]
	then
		echo -e "[+]$green $Module module removed $endcolor"
	else
		echo -e "[+]$red $Module module failed to be remove $endcolor"
	fi
done
