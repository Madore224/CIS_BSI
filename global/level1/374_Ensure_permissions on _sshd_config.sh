#!/bin/bash

echo "[+] Ensure permission on sshd config"

output=$(stat /etc/ssh/sshd_config 2>&1)

if [[ $output == *"No such file or directory"* ]]; then
    echo ""
else
    echo ""

    if [[ $output == *"Uid: (   0/root)"* && $output == *"Gid: (   0/root)"* ]]; then
        echo ""
    else
        echo ""
    fi

    if [[ $output == *"Access: (0600/-rw-------)"* ]]; then
        echo ""
    else
        echo ""
        echo ""

        chown root:root /etc/ssh/sshd_config
        chmod og-rwx /etc/ssh/sshd_config

        echo ""
    fi
fi

