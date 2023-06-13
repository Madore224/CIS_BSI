#!/bin/bash

echo "[+] Verify if audit log are not automatically deleted..."

sed -i '/max_log_file_action/d' /etc/audit/auditd.conf

echo 'max_log_file_action = keep_logs' >> /etc/audit/auditd.conf
