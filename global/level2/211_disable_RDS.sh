#!/bin/bash

echo "[+] Disable RDS..."

output2=$(lsmod | grep rds)

check="false"
if modprobe -n -v rds | grep -q "install /bin/true"; then
	if [ -z "$output2" ]; then
		check="true"	
	fi
fi

if [[ "$check" == "false" ]]; then
	if [ -e /etc/modprobe.d/rds.conf ]; then
		echo "install rds /bin/true" >> /etc/modprobe.d/rds.conf

	else
		touch /etc/modprobe.d/rds.conf
		echo "install rds /bin/true" >> /etc/modprobe.d/rds.conf

	fi
fi
