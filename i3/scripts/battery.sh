currentBattery=$(acpi | grep "^Battery 0" | awk -F '%' '{print $1}' | awk -F ',' '{print $2}')

if [ $currentBattery -le 20 ]
then
	notify-send -u critical -i "$HOME/.config/i3/scripts/assets/low-battery-level.png" "Battery is low"
fi
