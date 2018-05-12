#!/bin/bash
#: Description: sometimes the shell is faster

# > filename

# for file in {a..z}$RANDOM
# do
# 	> "$file"
# done

# [joje@archlinux fileops_cms]$ ls | grep -v touch.sh | xargs rm

touch {zzz,xxx,yyy}\ a ## 'zzz a' 'xxx a' 'yyy a'
# for file in $(ls *\ *)
for file in *\ *
do
	echo "$file"
done

