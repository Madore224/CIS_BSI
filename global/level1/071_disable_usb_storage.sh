#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 71
if [ "$(modprobe -n -v usb-storage | grep 'install' | grep '/bin/true')" == "" ]
then
	if [ "$(lsmod | grep 'usb-storage')" != "" ]
	then
		echo -e "[+]$green Disable USB Storage $endcolor"
		echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb_storage.conf
		rmmod usb-storage > /dev/null 2>&1
	fi
fi
