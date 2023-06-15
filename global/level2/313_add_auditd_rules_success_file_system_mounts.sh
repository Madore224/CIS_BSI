#!/bin/bash

echo "[+] Add auditd rules for collect logs success file system mounts..."

if [ -e "/etc/audit/rules.d/mounts.rules" ]; then
    	echo "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts
-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" > /etc/audit/rules.d/mounts.rules	
else
	touch /etc/audit/rules.d/mounts.rules
	echo "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts
-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" >> /etc/audit/rules.d/mounts.rules
fi
