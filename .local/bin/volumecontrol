#!/usr/bin/env bash

volumenotify(){
  local currentVolume=$(pactl get-sink-volume @DEFAULT_SINK@| awk -F '%' '{print $1}' | awk '{print $5}')
  notify-send -r 555 -t 2000 -h int:value:$currentVolume " Volume : $currentVolume %"
}

volumeup(){
  pactl set-sink-volume @DEFAULT_SINK@ +10%;
  volumenotify
}

volumedown(){
  pactl set-sink-volume @DEFAULT_SINK@ -10%;
  volumenotify
}

volumemute(){
  pactl set-sink-mute @DEFAULT_SINK@ toggle
}

choice=$1
case "$choice" in
  "up") volumeup ;;
  "down") volumedown ;;
  "mute") volumemute ;;
  *) echo "give appropriate arg..." ;;
esac
