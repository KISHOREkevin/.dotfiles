#!/usr/bin/env bash

connect="Connect"
disconnect="Disconnect"

choice=$(echo -e "$connect\n$disconnect" | rofi -dmenu -theme-str 'inputbar { enabled: false; }')

connectWifi() {
  nmcli -g "IN-USE,SSID" device wifi list | awk -F ":" '{print $1,$2}' | rofi -dmenu -p "Select network to connect : " | xargs nmcli device wifi connect
}

disconnectWifi() {
  nmcli device disconnect wlan0
}

case "$choice" in
$connect) connectWifi ;;
$disconnect) disconnectWifi ;;
*) echo "Choose correct one" ;;
esac
