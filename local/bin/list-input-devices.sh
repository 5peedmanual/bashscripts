#!/bin/sh

cd /sys/class/input/

for i in $(ls); do
	if [ -f $i/device/name ]; then
		printf "\ndir: %s/%s\n" $(pwd) $i
		cat $i/device/name; 
	fi
done
