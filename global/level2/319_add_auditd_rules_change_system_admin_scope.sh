#!/bin/bash

echo "[+] Add auditd rules for collect logs changes to system administration scope (sudoers)..."

if [ -e "/etc/audit/rules.d/scope.rules" ]; then
    	echo "-w /etc/sudoers -p wa -k scope
-w /etc/sudoers.d/ -p wa -k scope" > /etc/audit/rules.d/scope.rules
else
	touch /etc/audit/rules.d/scope.rules
	echo "-w /etc/sudoers -p wa -k scope
-w /etc/sudoers.d/ -p wa -k scope" >> /etc/audit/rules.d/scope.rules
fi
