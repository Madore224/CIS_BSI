#!/bin/bash

echo "[+] Add auditd rules for collect logs of system network environment..."

if [ -e "/etc/audit/rules.d/system-locale.rules" ]; then
    	echo "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale
-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale
-w /etc/issue -p wa -k system-locale
-w /etc/issue.net -p wa -k system-locale
-w /etc/hosts -p wa -k system-locale
-w /etc/network -p wa -k system-locale" > /etc/audit/rules.d/system-locale.rules
    	
else
	touch /etc/audit/rules.d/system-locale.rules
	echo "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale
-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale
-w /etc/issue -p wa -k system-locale
-w /etc/issue.net -p wa -k system-locale
-w /etc/hosts -p wa -k system-locale
-w /etc/network -p wa -k system-locale" >> /etc/audit/rules.d/system-locale.rules
fi
