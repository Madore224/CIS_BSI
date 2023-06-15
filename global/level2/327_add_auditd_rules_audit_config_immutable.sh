#!/bin/bash

echo "[+] Add auditd rules for collect logs audit configuration is immutable..."

if [ -e "/etc/audit/rules.d/99-finalize.rules" ]; then
    	echo "-e 2" > /etc/audit/rules.d/99-finalize.rules
else
	touch /etc/audit/rules.d/99-finalize.rules
	echo "-e 2" >> /etc/audit/rules.d/99-finalize.rules
fi
