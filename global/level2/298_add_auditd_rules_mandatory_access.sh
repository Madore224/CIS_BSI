#!/bin/bash

echo "[+] Add auditd rules for collect logs of mandatory access controls..."

if [ -e "/etc/audit/rules.d/MAC-policy.rules" ]; then
    	echo "-w /etc/apparmor/ -p wa -k MAC-policy
-w /etc/apparmor.d/ -p wa -k MAC-policy" > /etc/audit/rules.d/MAC-policy.rules
    	
else
	touch /etc/audit/rules.d/MAC-policy.rules
	echo "-w /etc/apparmor/ -p wa -k MAC-policy
-w /etc/apparmor.d/ -p wa -k MAC-policy" >> /etc/audit/rules.d/MAC-policy.rules
fi
