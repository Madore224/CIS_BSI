#!/bin/bash

echo "[+] Audit log storage size..."

sed -i '/max_log_file/d' /etc/audit/auditd.conf

echo 'max_log_file = 20' >> /etc/audit/auditd.conf
