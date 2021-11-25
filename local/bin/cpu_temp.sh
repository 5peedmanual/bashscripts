#!/bin/bash

zonez=$(cat /sys/class/thermal/thermal_zone0/temp)
zoneo=$(cat /sys/class/thermal/thermal_zone1/temp)
zonetw=$(cat /sys/class/thermal/thermal_zone2/temp)
zoneth=$(cat /sys/class/thermal/thermal_zone3/temp)


printf "zone 0: %s\nzone 1: %s\nzone 2: %s \nzone 3: %s\n" ${zonez} ${zoneo} ${zonetw} ${zoneth}
