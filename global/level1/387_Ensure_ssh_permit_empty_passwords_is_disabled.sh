#!/bin/bash

echo "[+] Ensure SSH permit empty passowrd is disabled"

output=$(sshd -T | grep "permitemptypasswords")

if [[ -n $output ]]; then
    if [[ $output == *"PermitEmptyPasswords no"* ]]; then
        echo ""
    else
        echo ""
        echo ""

        if grep -q "PermitEmptyPasswords" /etc/ssh/sshd_config; then
            sed -i 's/^.*PermitEmptyPasswords.*$/PermitEmptyPasswords no/' /etc/ssh/sshd_config
        else
            echo "" >> /etc/ssh/sshd_config
        fi

        echo ""
    fi
else
    echo ""
fi

