#!/bin/env bash

echo "[+] Ensure outbound and established connection are configured"

# Vérifier les règles iptables
iptables -L -v -n > /dev/null 2>&1


