#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"


#page 94
if [ "$(grep '^root:[*\!]:' /etc/shadow)" != "" ]
then
	echo -e "[+]$green Change root password $endcolor"
	passwd root
fi
