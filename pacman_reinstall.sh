#!/bin/sh

PACKAGES=$(pacman -Qk 2>&1 | egrep "^warni*." | awk -F':' '{print $2}' | uniq)
for i in ${PACKAGES}; do
printf "reinstalling : %s\n" $i
sudo pacman -S $i
done

