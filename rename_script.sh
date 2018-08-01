#!/bin/bash


DIR="$(pwd)/*"
thescript="$(pwd)/rename_script.sh"
VAR='This is word.mp3'
for f in $DIR
do
	if [ "$f" == "$thescript" ] || [ "${f##*.}" == "mp3" ]; then
		continue
	fi
	mv "$f" "$f.mp3" 
done
#echo ${VAR##*.}
#new_VAR="${VAR}.mp3"
#echo $new_VAR
