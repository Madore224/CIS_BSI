#!/bin/bash

# Check if IPv6 is disabled
ipv6_disabled=$(grep "^\s*linux" /boot/grub/grub.cfg | grep -v ipv6.disable=1)

if [[ -n "$ipv6_disabled" ]]; then
  echo "IPv6 is disabled."
else
  # Verify ip6tables policy
  ip6tables_policy=$(ip6tables -L | awk '/Chain (INPUT|OUTPUT|FORWARD)/{chain=$2; getline; policy=$NF; print chain,policy}')

  # Loop through each chain and verify the policy
  while read -r chain policy; do
    if [[ "$policy" != "DROP" && "$policy" != "REJECT" ]]; then
      echo "The policy for chain $chain is not DROP or REJECT. Setting the default DROP policy..."
      ip6tables -P "$chain" DROP
    else
      echo "The policy for chain $chain is already set to $policy."
    fi
  done <<< "$ip6tables_policy"
fi

