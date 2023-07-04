#!/bin/env bash

echo "[+] Ensure loopback traffic is configured"

# Verify INPUT rules
iptables -L INPUT -v -n > /dev/null 2>&1
#expected_input_rules="-i lo -j ACCEPT"
#if ! echo "$input_rules" | "$expected_input_rules"; then
#  echo ""
#"  iptables -A INPUT -i lo -j ACCEPT
#  iptables -A INPUT -s 127.0.0.0/8 -j DROP
#else
#  echo ""
#fi

# Verify OUTPUT rules
iptables -L OUTPUT -v -n > /dev/null 2>&1
#expected_output_rules="-o lo -j ACCEPT"
#if ! echo "$output_rules" "$expected_output_rules"; then
  #echo ""
  #iptables -A OUTPUT -o lo -j ACCEPT
#else
  #echo ""
#fi

