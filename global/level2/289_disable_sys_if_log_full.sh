#!/bin/bash

echo "[+] Disable system when log is full..."

sed -i '/space_left_action/d' /etc/audit/auditd.conf
sed -i '/action_mail_acct/d' /etc/audit/auditd.conf
sed -i '/admin_space_left_action/d' /etc/audit/auditd.conf

echo 'space_left_action = email' >> /etc/audit/auditd.conf
echo 'action_mail_acct = root' >> /etc/audit/auditd.conf
echo 'admin_space_left_action = halt' >> /etc/audit/auditd.conf
