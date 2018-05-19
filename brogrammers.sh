#!/bin/bash
# FILE1=$1
# echo ${#FILE1}
# if [ ${#FILE1} > 6 ]; then
#     #chown -R www-data:www-data $FILE1
#     #chmod -R g+rw $FILE1
#     echo "updated permissions on the folder $FILE1"
# else
#     #chown -r www-data:www-data /var/www
#     #chmod -r g+rw /var/www
#     echo "updated permissions on /var/www"
#  fi

function confirm ()
{
	read -sn1 -t 5 -p "Continue (y/n)? " var
	case ${var^} in
		Y)	;;
		N)	if  [ "$1" ] # if arg passed
			then 
				printf "\n"
				return 0
			else
				printf "\n" && exit 1
			fi
			;;
		"")	printf "\n" && exit 1 ;;#empty
		*)	printf "\nSay again?\n" && exit 1 ;;
	esac
}

function check_stored () 
{
	if [ -e ~/stored_dir.txt ]
	then
		catd=`cat stored_dir.txt` 
		printf "Your saved directory: %s \n" "$catd"
		return 0
	else
		printf "You don't have a file to store the directory.	Should I create one?\n"
		confirm "dont exit"
		>stored_dir.txt
		printf "Done."
	fi
}
	

function directory () 
{
	check_stored
	printf "Enter a directory (absolute or relative to $PWD):\n"
	read dir
	if [ -z "$dir" ]
	then
		printf "No directory stored.\n"
		exit 1
	else
		if [ -d "$dir" ] # check directory
		then
			printf "Do you wish to store this dir?\n"
			confirm "dont store"	# simply passing 
						# an arg so that
						# we dont exit

			echo "${dir}" > stored_dir.txt # create the file
		else
			printf "Directory doesn't exist or you don't have permissions\n"
			exit 1
		fi
	fi
}

function file () 
{

	printf "Enter a file: \n"
	read file
	if [ -z "$file" ]
	then
		printf "Need a file, you nerd.\n"
	else 
		if [ -f "$file" ] || [ -d "${dir}${file}" ]
		then
			#clean_dir "${dir}${file}"
			printf "Selected file: %s \n" "${dir}${file}"
			confirm 
			permissions "${dir}${file}"
		else
			printf "Selected file: %s \n" "${dir}${file}"
			printf "File doesn't exit or you don't have permission.\n"
		fi
	fi

}
# function permissions () 
# {
# 	printf "Select command: 1) chmod\n 2) chown\n "
# 	read -sn1 -p var
# 	case ${var^} in
# 		1)	printf "chmod (" 
# 	
# 	printf "chmod ... %s " "$1"
# 	read
#  	#chown -r www-data:www-data /var/www
#  	#chmod -r g+rw /var/www
#  	printf "updated permissions on /var/www"
#  else
#  	
#  	#chown -R www-data:www-data "${file}"
#  	#chmod -R g+rw "${file}"
#  	printf "updated permissions on the folder %s\n" "${file}"
#  fi
#}

function clean_dir ()
{
	dir="$1"
	printf "%s\n" "${dir}"
}

directory 
file
