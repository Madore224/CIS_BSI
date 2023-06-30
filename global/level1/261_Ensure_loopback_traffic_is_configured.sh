#!/bin/env bash

echo "[+] Ensure loopback traffic is configured"

# Verify INPUT rules
input_rules=$(iptables -L INPUT -v -n)
expected_input_rules="-i lo -j ACCEPT"
if ! echo "$input_rules" | grep -q "$expected_input_rules"; then
  echo ""
  iptables -A INPUT -i lo -j ACCEPT
  iptables -A INPUT -s 127.0.0.0/8 -j DROP
else
  echo ""
fi

# Verify OUTPUT rules
output_rules=$(iptables -L OUTPUT -v -n)
expected_output_rules="-o lo -j ACCEPT"
if ! echo "$output_rules" | grep -q "$expected_output_rules"; then
  echo ""
  iptables -A OUTPUT -o lo -j ACCEPT
else
  echo ""
fi

