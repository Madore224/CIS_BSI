#!/bin/bash

echo "[+] Installation SSH"


# Update package lists
sudo apt update > /dev/null 2>&1

# Install SSH client
sudo apt install -y ssh > /dev/null 2>&1

# Install SSH server (sshd)
sudo apt install -y openssh-server > /dev/null 2>&1

# Start the SSH server
sudo service ssh start > /dev/null 2>&1

# Enable SSH server to start on system boot
sudo systemctl enable ssh > /dev/null 2>&1

# Print SSH status
sudo service ssh status > /dev/null 2>&1

echo "[+] Ensure permission on sshd config"

output=$(stat /etc/ssh/sshd_config > /dev/null 2>&1) 

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

