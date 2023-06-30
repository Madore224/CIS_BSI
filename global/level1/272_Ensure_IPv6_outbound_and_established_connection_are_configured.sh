#!/bin/bash

echo "[+] Ensure IPv6 outbound and established connections are configured"

# Check if IPv6 is disabled
ipv6_disabled=$(grep "^\s*linux" /boot/grub/grub.cfg | grep -v ipv6.disable=1)

if [[ -n "$ipv6_disabled" ]]; then
  echo ""
else
  # Verify ip6tables rules
  ip6tables_rules=$(ip6tables -L -v -n)

  # Verify rules for new outbound and established connections
  expected_outbound_rules=("tcp -m state --state NEW,ESTABLISHED -j ACCEPT"
                          "udp -m state --state NEW,ESTABLISHED -j ACCEPT"
                          "icmp -m state --state NEW,ESTABLISHED -j ACCEPT")
  expected_established_rules=("tcp -m state --state ESTABLISHED -j ACCEPT"
                              "udp -m state --state ESTABLISHED -j ACCEPT"
                              "icmp -m state --state ESTABLISHED -j ACCEPT")

  for rule in "${expected_outbound_rules[@]}"; do
    if ! echo "$ip6tables_rules" | grep -q "$rule"; then
      echo ""
      ip6tables -A OUTPUT -p $rule
    else
      echo ""
    fi
  done

  for rule in "${expected_established_rules[@]}"; do
    if ! echo "$ip6tables_rules" | grep -q "$rule"; then
      echo ""
      ip6tables -A INPUT -p $rule
    else
      echo ""
    fi
  done
fi

