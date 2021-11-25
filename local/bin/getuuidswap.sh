#!/bin/bash
cmd="$(mkswap /dev/mapper/vg0-lv_swap)"
printf "%s\tnone\tswap\t\tdefaults\t0 0\n" "${cmd:74:41}" >> /etc/fstab
