#!/bin/bash

#Fiable 65 %
echo "[+] Unload the usb-storage..."

output2=$(lsmod | grep usb-storage)

check="false"
if modprobe -n -v usb-storage >/dev/null 2>&1 == "install /bin/true"; then
	if [ -z "$output2" ]; then
		check="true"	
	fi
fi

if [[ "$check" == "false" ]]; then
	if [ -e /etc/modprobe.d/usb_storage.conf ]; then
		echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb_storage.conf
		rmmod usb-storage
	else
		touch /etc/modprobe.d/usb_storage.conf
		echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb_storage.conf
		rmmod usb-storage
	fi
fi


