#!/bin/bash

# > testfile.txt ## create file

### reading a file
testfile=testfile.txt
while read ## no name supplied to read, $REPLY variable will be used
do
	printf "%s\n" "$REPLY"
	## output
	## John	222-2222
done < "$testfile"

## passing more variable names to read
while read name number
do
	printf "Name: %-10s\tPhone: %s\n" "$name" "$number"
	## output
	## Name: John      	Phone: 222-2222 
done < "$testfile"


