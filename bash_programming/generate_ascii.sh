#!/bin/bash

a=97
A=65
for l in {a..z}
do
	printf "[\"%s\"]="${a}" " $l
	((a++))
done
echo

for l in {A..Z}
do
	printf "[\"%s\"]="${A}" " $l
	((A++))
done
echo
