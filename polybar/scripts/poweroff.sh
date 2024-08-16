choice=0
echo -e "Are you want to : \ny - poweroff\nr - reboot\nn - Cancel"
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
    elif [ $RESPONSE = "n" ]
    then
	exit 0
	choice=1
    else 
        echo "Enter a valid input !!!"
        choice=0
    fi
done
