#!/bin/bash
#: Description	: Simple prompt using -p in read
#		: -s do not echo input from terminal
#		: -n read a maximum no of characters
#		: -t timeout
#		: time, prints time taken for execution of a command

time { # creates a subshell
read -sn1 -t 2 -p "Continue (y/n)? " var
case ${var^} in ## convert $var to uppercase
	Y) 	;;
	N)	printf "\n%s\n" "Good bye"
		exit
		;;
esac
}
