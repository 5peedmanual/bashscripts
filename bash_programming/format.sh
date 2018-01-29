#!/bin/bash
#: Description : print formatted sales report

divider===========================
divider=$divider$divider

## Format strings for printf
header="\n  %-10s %11s %8s %10s\n"
format="\b\b%10s  %11.2f  %8d  %10.2f\n"

## Width of divider
total_width=44

## Print caegories
printf "$header" ITEM "PER UNIT" NUM TOTAL

## Print divider to match width of report
printf "%$total_width.${total_width}s\n" "$divider"

## Print lines of report
printf "$format" \
Chair 79.23 4 132.8 \
Table 223.12 1 222.22 \
Socks 22.1 1 11.11
