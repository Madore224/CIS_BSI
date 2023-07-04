#!/bin/bash

echo "[+] Ensure remote rsyslog"

# Check for $ModLoad imtcp
imtcp_config=$(grep '$ModLoad imtcp' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null)

if [[ -z "$imtcp_config" ]]; then
  echo ""
  exit 1
fi

# Check for $InputTCPServerRun
input_tcp_server_config=$(grep '$InputTCPServerRun' /etc/rsyslog.conf /etc/rsyslog.d/*.conf > /dev/null 2>&1)

if [[ -z "$input_tcp_server_config" ]]; then
  echo ""
  exit 1
fi

echo ""

