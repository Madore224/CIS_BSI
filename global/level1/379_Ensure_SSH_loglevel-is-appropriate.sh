#!/bin/bash

echo "[+] Ensure SSH loglevel is appropriate"

output=$(sshd -T | grep "loglevel")

if [[ -n $output ]]; then
    if [[ $output == *"loglevel INFO"* || $output == *"LogLevel VERBOSE"* ]]; then
        echo ""
    else
        echo ""
        echo ""

        if grep -q "loglevel" /etc/ssh/sshd_config; then
            sed -i 's/^.*loglevel.*$/LogLevel INFO/' /etc/ssh/sshd_config
        else
            echo "LogLevel INFO" >> /etc/ssh/sshd_config
        fi

        if grep -q "loglevel" /etc/ssh/ssh_config; then
            sed -i 's/^.*loglevel.*$/LogLevel INFO/' /etc/ssh/ssh_config
        else
            echo "LogLevel INFO" >> /etc/ssh/ssh_config
        fi

        echo ""
    fi
else
    echo ""
fi
