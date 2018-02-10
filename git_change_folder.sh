#!/bin/bash

#STOREIFS=$IFS

function clone ()
{
	echo "Clonning... $@" 
	sleep 1
	git clone $1
	#split_name_ncd $1
}


function split_name_ncd ()
{
	#IFS='/.' # Intentional Field Separator
	link="$1"
	linknoslash=${link##*/}
	#echo $linknoslash
	dir=${linknoslash%.*}
	echo $dir
	cd $dir"/"
}

function rename () 
{	
	echo "rename"
	declare -a pythonolddirs=("Python/" "Python3/" "Python2")
	declare -a others=("C/" "C#/" "NodeJS/" "CPP/" "JS/" "Swift/")
	pwd
	sleep 1
	# ls on directories
	for d in */; 
	do 
		echo "$d"
		# see if d is in our directories array
		case "${pythonolddirs[@]}" in *"$d"*) 
				echo "found" 
				sleep .5
				#mv "$d" "py/" ;;
				git mv "$d" "py/" ;;
			*) echo "--" ;;
		esac
		case "${others[@]}" in *"$d"*)
				echo "found"
				sleep .5
				#mv "$d" `echo "$d" | tr 'A-Z' 'a-z'` ;;
				git mv "$d" `echo "$d" | tr 'A-Z' 'a-z'` ;;
		*) echo "not found" ;;
		esac 
	done 
	# exit 0
	add_changes
	cd ../

}

function add_changes () 
{
	git add --all
	git commit -m "Rename"
	git push -u origin master
}

mkdir clones; mv gitlinks.txt clones/; cd clones  # make a new dir and go to it

# echo "Enter file (ex: file.txt): "
# read file
# if [ -z file ] # if file is empty
# then
# 	echo "I need the file to continue."
# 	exit 0
# fi




# loop thr ough each link in file
while read link; 
do
 	printf "link %s\n" $link
	#clone $link
	split_name_ncd $link
	rename
	#echo $link
	# IFS=$STOREIFS
	# unset IFS
	exit 0
done <gitlinks.txt


