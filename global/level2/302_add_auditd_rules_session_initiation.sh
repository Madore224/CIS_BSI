#!/bin/bash

echo "[+] Add auditd rules for collect logs session initiation information..."

if [ -e "/etc/audit/rules.d/session.rules" ]; then
    	echo "-w /var/run/utmp -p wa -k session
-w /var/log/wtmp -p wa -k logins
-w /var/log/btmp -p wa -k logins" > /etc/audit/rules.d/session.rules
    	
else
	touch /etc/audit/rules.d/session.rules
	echo "-w /var/run/utmp -p wa -k session
-w /var/log/wtmp -p wa -k logins
-w /var/log/btmp -p wa -k logins" >> /etc/audit/rules.d/session.rules
fi
