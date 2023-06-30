#!/bin/bash

echo "[+] Ensure ssh hostbase authentication is enabled"

output=$(sshd -T | grep "hostbasedauthentication")

if [[ -n $output ]]; then
    if [[ $output == *"HostbasedAuthentication no"* ]]; then
        echo ""
    else
        echo ""
        echo ""

        if grep -q "HostbasedAuthentication" /etc/ssh/sshd_config; then
            sed -i 's/^.*HostbasedAuthentication.*$/HostbasedAuthentication no/' /etc/ssh/sshd_config
        else
            echo "" >> /etc/ssh/sshd_config
        fi

        echo ""
    fi
else
    echo ""
fi

