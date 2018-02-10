#!/bin/bash

function split_name_ncd ()
{
	IFS='/.' # Intentional Field Separator
	pre=:
	post=:
	# printf "$pre%s$post\n" $@
	#printf "%s\n" $3
	echo "dir name $3/"
}


function process ()
{
	echo "link $i $1"
	#git clone $@
	split_name_ncd $1
}

#mkdir git2 cd git2 # make a new dir and go to it

echo "Enter file (ex: file.txt): "
read file
if [ -z file ] # if file is empty
then
	echo "I need the file to continue."
	exit 0
fi




# loop thr ough each link in file
while read -r -u 10 link; 
do
 	#process $link
	echo $link
done 10<links.txt


