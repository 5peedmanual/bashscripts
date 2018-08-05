#!/bin/bash

declare -A full_names

full_names=( ["lhunath"]="Maarten Billemont" ["greycat"]="Greg Wooledge" )

echo "Full name: ${full_names[lhunath]}"
