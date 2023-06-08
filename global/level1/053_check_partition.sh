#!/bin/bash

#page 53 to 57

command=$(mount)
if echo $command | grep -q -E '\s/var/tmp\s'
then
        echo "[+] Ensure nodev,nosuid,noexec option set on /set/tmp partition"
        mount -o remount,nodev /var/tmp
        mount -o remount,nosuid /var/tmp
        mount -o remount,noexec /var/tmp
fi
