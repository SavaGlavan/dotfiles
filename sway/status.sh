while true; do
  # get date and time in desired formate
  date_formatted="$(date +'%A %H:%M:%S %d-%m-%Y')"
  # get screen brightness
  brightness=$(($(brightnessctl g)*100/$(brightnessctl m)))
  # get battery status (charging, not charging, discharging)
  battery_status=$(cat /sys/class/power_supply/BAT0/status)
  if [ "$battery_status" = "Charging" ]; then
    # case where battery is charging
    battery_status="▲"
  elif [ "$battery_status" = "Discharging" ]; then
    # case where battery is discharging
    battery_status="▼"
  else
    # case where battery is maintaining
    battery_status="■"
  fi
  # get battery percentage
  battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
  echo ${brightness}% brightness "|" battery ${battery_capacity}% ${battery_status} "|" ${date_formatted}
  sleep 1
done