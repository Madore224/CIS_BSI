#!/bin/bash

#page 22-32
for Module in "cramfs" "freevxfs" "jffs2" "hfs" "hfsplus" "udf" "vfat"
do
	required="install /bin/true "
	installstatus=$(modprobe -n -v $Module | grep -E "($Module|install)")
	if [ "$installstatus" != "$required" ]
	then
		touch /etc/modprobe.d/$Module.conf
		echo "install $Module /bin/true" > /etc/modprobe.d/$Module.conf
		rmmod $Module > /dev/null 2>&1
	fi
	installstatus=$(modprobe -n -v $Module | grep -E "($Module|install)")
	if [ "$installstatus" == "$required" ]
	then
		echo -e "[+] $Module module removed"
	else
		echo -e "[+] $Module module failed to be remove"
	fi
done
