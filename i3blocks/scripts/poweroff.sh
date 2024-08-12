read -p "Are you sure you want to shutdown [y/n] : " RESPONSE
if [ "$RESPONSE" = "y" ]
then
        poweroff
else
        echo "poweroff cancelled..."
fi
