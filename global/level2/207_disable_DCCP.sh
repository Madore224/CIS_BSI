#!/bin/bash

echo "[+] Disable DCCP..."

output2=$(lsmod | grep dccp)

check="false"
# Check if the output are correct or not
if modprobe -n -v dccp | grep -q "install /bin/true"; then
	if [ -z "$output2" ]; then
		check="true"	
	fi
fi

# if the output are not correct
if [[ "$check" == "false" ]]; then
	if [ -e /etc/modprobe.d/dccp.conf ]; then
		echo "install dccp /bin/true" >> /etc/modprobe.d/dccp.conf

	else
		touch /etc/modprobe.d/dccp.conf
		echo "install dccp /bin/true" >> /etc/modprobe.d/dccp.conf

	fi
fi
