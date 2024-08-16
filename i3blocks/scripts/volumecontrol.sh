#!/usr/bin/env bash      
 choice=$1
 defaultIndex=$(pactl get-default-sink)
 currentVolume=$(pactl get-sink-volume @DEFAULT_SINK@| awk -F '%' '{print $1}' | awk '{print $5}')
 volumeup(){
	pactl set-sink-volume @DEFAULT_SINK@ "$(( $currentVolume + 1 ))%"
	local cvolume=$(pactl get-sink-volume @DEFAULT_SINK@| awk -F '%' '{print $1}' | awk '{print $5}')

	notify-send -r 555 -t 2000 " Volume : $cvolume %"
}


volumedown(){
	pactl set-sink-volume @DEFAULT_SINK@ "$(( $currentVolume - 1 ))%"
	local cvolume=$(pactl get-sink-volume @DEFAULT_SINK@| awk -F '%' '{print $1}' | awk '{print $5}')

	notify-send -r 555 -t 2000 " Volume : $cvolume %"
}

getVolume(){
	local cvolume=$(pactl get-sink-volume @DEFAULT_SINK@| awk -F '%' '{print $1}' | awk '{print $5}')
	echo $cvolume 

}



if [[ $choice = "up" ]]
then
	volumeup
elif [[ $choice = "down" ]]
then
	volumedown
elif [[ $choice = "current" ]]
then
	getVolume
else
	echo "give correct choice [ up/down] !!!"
fi

	 
