choice=0
while [ $choice = 0 ];
do
	read -p "Do you want to reboot ? [y/n] : " RESPONSE
	if [ $RESPONSE = "y" ]
	then
     		shutdown -r now
		choice=1
	elif [ $RESPONSE = "n" ]
	then
		echo "reboot cancelled..."
		choice=1 
	else
		echo "Enter a valis input !!!"
		choice=0
	fi
done
