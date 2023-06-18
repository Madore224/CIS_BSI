#!/bin/bash

echo "[+] Disable ssh allow TCP Forwarding..."

if [ -e "/etc/ssh/sshd_config" ]; then
	echo "# AllowTcpForwarding no" >> /etc/ssh/sshd_config
fi
