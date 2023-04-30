#!/bin/bash

#Fiable 65 %
echo -e "START unload the usb-storage...\n"

if [ -e /etc/modprobe.d/usb_storage.conf ]; then
    echo "File exist"
    echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb_storage.conf
else
    echo -e "File not exist"
    touch /etc/modprobe.d/usb_storage.conf
    echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb_storage.conf
fi

sudo rmmod usb-storage