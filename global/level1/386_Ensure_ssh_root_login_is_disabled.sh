#!/bin/bash

echo "[+] Ensure SSH root login is disabled"

output=$(sshd -T | grep "permitrootlogin")

if [[ -n $output ]]; then
    if [[ $output == *"PermitRootLogin no"* ]]; then
        echo ""
    else
        echo ""
        echo ""

        if grep -q "PermitRootLogin" /etc/ssh/sshd_config; then
            sed -i 's/^.*PermitRootLogin.*$/PermitRootLogin no/' /etc/ssh/sshd_config
        else
            echo "" >> /etc/ssh/sshd_config
        fi

        echo ""
    fi
else
    echo ""
fi

