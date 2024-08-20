#!/usr/bin/env bash
choice=0
echo -e "Are you want to : \n p - poweroff\n r - reboot\n l - logout\n s - sleep\n n - Cancel"
while [ $choice = 0 ];
do
    read -p "Enter the choice : " RESPONSE

    case $RESPONSE in
	p) shutdown now;choice=1;;
	r) shutdown -r now;choice=1;;
	l) i3 exit;choice=1;;
	s) systemctl suspend;choice=1;;
	n) exit 0;choice=1;;
	*) echo "Enter a valid input !!!";choice=0;;
    esac
done
