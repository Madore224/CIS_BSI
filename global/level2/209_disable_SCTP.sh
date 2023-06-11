#!/bin/bash

echo "[+] Disable SCTP..."

output2=$(lsmod | grep sctp)

check="false"
if modprobe -n -v sctp | grep -E '(sctp|install)' | grep -q "install /bin/true"; then
	if [ -z "$output2" ]; then
		check="true"	
	fi
fi

if [[ "$check" == "false" ]]; then
	if [ -e /etc/modprobe.d/sctp.conf ]; then
		echo "install sctp /bin/true" >> /etc/modprobe.d/sctp.conf

	else
		touch /etc/modprobe.d/sctp.conf
		echo "install sctp /bin/true" >> /etc/modprobe.d/sctp.conf

	fi
fi
