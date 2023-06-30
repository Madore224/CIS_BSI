#!/bin/bash

# Check for $ModLoad imtcp
imtcp_config=$(grep '$ModLoad imtcp' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null)

if [[ -z "$imtcp_config" ]]; then
  echo "Missing '$ModLoad imtcp' configuration. Please refer to page 242."
  exit 1
fi

# Check for $InputTCPServerRun
input_tcp_server_config=$(grep '$InputTCPServerRun' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null)

if [[ -z "$input_tcp_server_config" ]]; then
  echo "Missing '$InputTCPServerRun' configuration. Please refer to page 242."
  exit 1
fi

echo "Configuration is valid."

