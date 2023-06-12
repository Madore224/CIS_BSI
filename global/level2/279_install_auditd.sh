#!/bin/bash

if dpkg -s auditd audispd-plugins >/dev/null 2>&1; then
	echo "[+] Install auditd..."
else
	echo "[+] Install auditd..."
	apt -y install auditd audispd-plugins >/dev/null 2>&1
fi
