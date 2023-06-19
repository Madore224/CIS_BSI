#!/bin/bash

# Verify policy of base chains
input_chain=$(nft list ruleset | grep 'hook input')
forward_chain=$(nft list ruleset | grep 'hook forward')
output_chain=$(nft list ruleset | grep 'hook output')

if [[ ! "$input_chain" =~ "policy drop" ]]; then
  echo "Policy of input chain is not DROP. Setting policy to DROP..."
  # Set policy of input chain to DROP using "nft chain"
  nft chain inet filter input { policy drop \; }
  echo "Policy of input chain set to DROP."
else
  echo "Policy of input chain is already DROP."
fi

if [[ ! "$forward_chain" =~ "policy drop" ]]; then
  echo "Policy of forward chain is not DROP. Setting policy to DROP..."
  # Set policy of forward chain to DROP using "nft chain"
  nft chain inet filter forward { policy drop \; }
  echo "Policy of forward chain set to DROP."
else
  echo "Policy of forward chain is already DROP."
fi

if [[ ! "$output_chain" =~ "policy drop" ]]; then
  echo "Policy of output chain is not DROP. Setting policy to DROP..."
  # Set policy of output chain to DROP using "nft chain"
  nft chain inet filter output { policy drop \; }
  echo "Policy of output chain set to DROP."
else
  echo "Policy of output chain is already DROP."
fi

