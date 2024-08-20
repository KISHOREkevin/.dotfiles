#!/usr/bin/env bash
fastfetch
choice=0
while [ $choice=0 ];do
	echo -ne "Press q to exit \n"
	read -n 1 response  
	if [ $response = "q" ] 2> /dev/null ;
	then
		exit 0
		choice=1
	fi
done
