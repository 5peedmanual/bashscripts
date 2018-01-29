#!/bin/bash
#: Description: case compares a word against one or more patterns and executes the commands 
# 		associated with that pattern. 


# Check for the number of arguments
case $# in
	2) ;; ## We need 3 args, so do nothing
	*) printf "%s\n" "Please provide two strings" >&2
		exit 1
		;;
esac

# Test if inputs are equal
case $1 in
	*"$2"*) echo true ;;
	*) echo false ;;
esac

# Check if input is a valid integer
case $1 in
	*[!0-9]*) echo false  ;;
	*) echo true ;;
esac
