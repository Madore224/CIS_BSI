#!/bin/bash

echo -e "START AppArmor set profiles...\n"

sudo apt-get install apparmor-utils
echo "install module apparmor-utils"
sudo aa-enforce /etc/apparmor.d/*


