#!/bin/bash

echo "[+] Add auditd rules for collect logs of user/group information..."

if [ -e "/etc/audit/rules.d/identity.rules" ]; then
    	echo "-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/security/opasswd -p wa -k identity" > /etc/audit/rules.d/identity.rules
    	
else
	touch /etc/audit/rules.d/identity.rules
	echo "-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/security/opasswd -p wa -k identity" >> /etc/audit/rules.d/identity.rules
fi
