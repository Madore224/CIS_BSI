#!/bin/bash

echo "[+] Disable ssh allow TCP Forwarding..."

if [ -e "/etc/ssh/sshd_config" ]; then
	echo "# AllowTcpForwarding no" >> /etc/ssh/sshd_config
else
	echo "File /etc/ssh/ssd_config not found."
fi
