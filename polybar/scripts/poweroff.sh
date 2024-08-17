choice=0
echo -e "Are you want to : \n y - poweroff\n r - reboot\n l - logout\n s - sleep\n n - Cancel"
while [ $choice = 0 ];
do
    read -p "Enter the choice : " RESPONSE
    if [ $RESPONSE = "y" ]
    then
            shutdown now
            choice=1
    elif [ $RESPONSE = "r" ]
    then
        shutdown -r now
        choice=1
    elif [ $RESPONSE = "l" ]
    then
	i3 exit
	choice=1
    elif [ $RESPONSE = "s" ]
    then
	systemctl suspend
	choice=1
    elif [ $RESPONSE = "n" ]
    then
	exit 0
	choice=1
    else 
        echo "Enter a valid input !!!"
        choice=0
    fi
done
