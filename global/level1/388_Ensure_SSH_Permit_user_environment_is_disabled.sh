#!/bin/bash

echo "[+] Ensure SSH permit user environment is disabled"

output=$(sshd -T | grep "permituserenvironment")

if [[ -n $output ]]; then
    if [[ $output == *"PermitUserEnvironment no"* ]]; then
        echo ""
    else
        echo ""
        echo ""

        if grep -q "PermitUserEnvironment" /etc/ssh/sshd_config; then
            sed -i 's/^.*PermitUserEnvironment.*$/PermitUserEnvironment no/' /etc/ssh/sshd_config
        else
            echo "" >> /etc/ssh/sshd_config
        fi

        echo ""
    fi
else
    echo ""
fi

