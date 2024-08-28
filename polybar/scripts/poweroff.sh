#!/usr/bin/env bash

poweroffopt='⏻ Poweroff'
rebootopt=' Reboot'
logoutopt='󰗽 Logout'
sleepopt='󰒲 Sleep'
cancelopt=' Cancel'
declare options="$poweroffopt\n$rebootopt\n$logoutopt\n$sleepopt\n$cancelopt"

choice=$(echo -e $options | rofi -dmenu -p "Choose to logout :") 
case $choice in
    $poweroffopt) shutdown now;;
    $rebootopt) shutdown -r now;;
    $logoutopt) i3 exit;;
    $sleepopt) systemctl suspend; i3lock -i $HOME/.config/xautolock//lockscreen.png;;
    $cancelopt) exit 0 ;;
    *) exit 0 ;;
esac

