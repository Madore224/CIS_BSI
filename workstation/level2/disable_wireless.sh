#!/bin/bash

# Ensure wireless interfaces are disabled
# On s'assure que les interfaces sans fil sont désactivées

if command -v nmcli >/dev/null 2>&1 ; then
	echo "\nWireless interfaces are disabled...\n"
	nmcli radio all off
else
	if [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; then
 		drivers=$(for driverdir in $(find /sys/class/net/*/ -type d -name 
		wireless | xargs -0 dirname); do basename "$(readlink -f 
		"$driverdir"/device/driver)";done | sort -u)
 		for dm in $drivers; do
 			echo "install $dm /bin/true" >> /etc/modprobe.d/disable_wireless.conf
 		done
 	fi
fi
