read -p "Do you want to reboot ? [y/n] : " RESPONSE
if [[ "$RESPONSE" = "y" ]]
then 
     reboot
else
     echo "reboot cancelled..."
fi
