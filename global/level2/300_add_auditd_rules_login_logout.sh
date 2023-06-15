#!/bin/bash

echo "[+] Add auditd rules for collect logs of login and logout..."

if [ -e "/etc/audit/rules.d/logins.rules" ]; then
    	echo "-w /var/log/faillog -p wa -k logins
-w /var/log/lastlog -p wa -k logins
-w /var/log/tallylog -p wa -k logins" > /etc/audit/rules.d/logins.rules
    	
else
	touch /etc/audit/rules.d/logins.rules
	echo "-w /var/log/faillog -p wa -k logins
-w /var/log/lastlog -p wa -k logins
-w /var/log/tallylog -p wa -k logins" >> /etc/audit/rules.d/logins.rules
fi
