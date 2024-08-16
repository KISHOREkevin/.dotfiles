choice=0
while [ $choice = 0 ];
do
	read -p "Are you sure you want to shutdown [y/n] : " RESPONSE
	if [ "$RESPONSE" = "y" ]
	then
        	shutdown now
		choice=1
	elif [ "$RESPONSE" = "n" ]
	then
        	echo "poweroff cancelled..."
		choice=1
	else 
		echo "Enter a valid input !!!"
		choice=0
	fi
done
