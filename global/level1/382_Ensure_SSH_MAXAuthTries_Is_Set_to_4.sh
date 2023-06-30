#!/bin/bash

echo "[+] Ensure SSH MAX Auth Tries is set to 4"

output=$(sshd -T | grep "maxauthtries")

if [[ -n $output ]]; then
    max_auth_tries=$(echo "$output" | awk '{print $2}')
    if [[ $max_auth_tries -le 4 ]]; then
        echo ""
    else
        echo ""
        echo ""

        if grep -q "MaxAuthTries" /etc/ssh/sshd_config; then
            sed -i 's/^.*MaxAuthTries.*$/MaxAuthTries 4/' /etc/ssh/sshd_config
        else
            echo "" >> /etc/ssh/sshd_config
        fi

        echo ""
    fi
else
    echo ""
fi

