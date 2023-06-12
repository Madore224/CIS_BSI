#!/bin/bash

echo "[+] Enable auditd..."

output2=$(systemctl is-enabled auditd)

if [ "$output2" == "enabled" ]; then
	true
else
	systemctl --now enable auditd >/dev/null 2>&1
fi
