#!/bin/bash

echo "[+] Add auditd rules for collect logs system administrator command executions (sudo)..."

if [ -e "/etc/audit/rules.d/actions.rules" ]; then
    	echo "-a always,exit -F arch=b64 -C euid!=uid -F euid=0 -Fauid>=1000 -F auid!=4294967295 -S execve -k actions 
-a always,exit -F arch=b32 -C euid!=uid -F euid=0 -Fauid>=1000 -F auid!=4294967295 -S execve -k actions" > /etc/audit/rules.d/actions.rules
else
	touch /etc/audit/rules.d/actions.rules
	echo "-a always,exit -F arch=b64 -C euid!=uid -F euid=0 -Fauid>=1000 -F auid!=4294967295 -S execve -k actions 
-a always,exit -F arch=b32 -C euid!=uid -F euid=0 -Fauid>=1000 -F auid!=4294967295 -S execve -k actions" >> /etc/audit/rules.d/actions.rules
fi
