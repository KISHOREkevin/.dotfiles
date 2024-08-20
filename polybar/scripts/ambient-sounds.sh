#!/usr/bin/env bash

nextsong(){
  mpc single off
  mpc next
}
prevsong(){
  mpc single off
  mpc prev
}
randommusic(){
  mpc clear
  mpc add /
  mpc random true
  mpc play
}

listallmusic(){
  mpc clear 
  local songs=$(mpc ls)
  local song=$(printf '%s\n' "${songs[@]}" | rofi -dmenu)
  mpc add $song
  mpc repeat true
  mpc random false
  mpc play
}

pausemusic(){
  mpc pause
}

resumemusic(){
  mpc play
}

stopmusic(){
  mpc stop
  mpc clear
}
declare -a options=(
  "Next song"
  "Prev song"
  "Random Music"
  "Play a music"
  "Resume current music"
  "Pause Music"
  "Stop Music"

)

choice=$( printf '%s\n' "${options[@]}" | rofi -dmenu) 

case $choice in
  "Next song") nextsong ;;
  "Prev song") prevsong ;;
  "Random Music") randommusic ;;
  "Play a music") listallmusic ;;
  "Resume current music") resumemusic ;;
  "Pause Music") pausemusic ;;
  "Stop Music") stopmusic ;;
  *) exit 0 ;;
esac
