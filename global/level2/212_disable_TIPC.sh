#!/bin/bash

echo "[+] Disable TIPC..."

output2=$(lsmod | grep tipc)

check="false"
if modprobe -n -v tipc | grep -E '(tipc|install)' | grep -q "install /bin/true"; then
	if [ -z "$output2" ]; then
		check="true"	
	fi
fi

if [[ "$check" == "false" ]]; then
	if [ -e /etc/modprobe.d/tipc.conf ]; then
		echo "install tipc /bin/true" >> /etc/modprobe.d/tipc.conf

	else
		touch /etc/modprobe.d/tipc.conf
		echo "install tipc /bin/true" >> /etc/modprobe.d/tipc.conf

	fi
fi
