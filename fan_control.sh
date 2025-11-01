#!/system/bin/sh

ON_THRESHOLD=75
OFF_THRESHOLD=60

while true; do
    TEMP=$(( $(cat /sys/class/thermal/thermal_zone0/temp) / 1000 ))

    if [ "$TEMP" -ge "$ON_THRESHOLD" ]; then
        gpioset gpiochip0 23=1
    elif [ "$TEMP" -le "$OFF_THRESHOLD" ]; then
        gpioset gpiochip0 23=0
    fi

    sleep 5
done