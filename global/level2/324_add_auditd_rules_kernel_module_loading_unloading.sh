#!/bin/bash

echo "[+] Add auditd rules for collect logs kernel module loading and unloading..."

if [ -e "/etc/audit/rules.d/modules.rules" ]; then
    	echo "-w /sbin/insmod -p x -k modules
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit -F arch=b64 -S init_module -S delete_module -k modules" > /etc/audit/rules.d/modules.rules
else
	touch /etc/audit/rules.d/modules.rules
	echo "-w /sbin/insmod -p x -k modules 
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit -F arch=b64 -S init_module -S delete_module -k modules" >> /etc/audit/rules.d/modules.rules
fi
