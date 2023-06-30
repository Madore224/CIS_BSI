#!/bin/bash

echo "[+] Ensure at is restricted to authorized users"

check_file() {
    file_path=$1
    output=$(stat "$file_path" 2>&1)
    if [[ $? -ne 0 ]]; then
        echo "$file_path does not exist."
        if [[ $file_path == "/etc/at.deny" ]]; then
            remove_at_deny
        else
            create_set_at_allow
        fi
    else
        echo "."
        if [[ $output == *"Uid: (   0/root)"* && $output == *"Gid: (   0/root)"* ]]; then
            echo ""
        else
            echo ""
        fi

        if [[ $output == *"Access: (0640/-rw-r-----)"* ]]; then
            echo ""
        else
            echo ""
        fi

        if [[ $output == *"Access: (0600/-rw-------)"* ]]; then
            echo ""
        else
            echo ""
        fi
    fi
}

remove_at_deny() {
    rm /etc/at.deny*
    echo "Removed /etc/at.deny."
}

create_set_at_allow() {
    touch /etc/at.allow
    chmod g-wx,o-rwx /etc/at.allow
    chown root:root /etc/at.allow
    echo ""
}

# Check /etc/at.deny
check_file "/etc/at.deny"

# Check /etc/at.allow
check_file "/etc/at.allow"

