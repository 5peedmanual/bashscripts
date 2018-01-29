#!/bin/bash
#: Description: Check if directory exists and cd into it

printf "Enter a directory: "
read dir
if [ -z "$dir" ]
then
	echo "No directory entered" >&2
	exit 1
else
	# test -d "$directory" && cd "$directory"
	if [ -d "$dir" ] && cd "$dir" # || echo "Directory doens't exist" && exit 1
	then
		echo "$PWD"
	else
		echo "Directory doesn't exist"
		exit 1
	fi
fi

