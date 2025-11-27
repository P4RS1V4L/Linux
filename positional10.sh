#!/bin/bash
#
#
for file in /home/rich/.b* /home/rich/badtest
do
	if [ -d "$file" ]
	then
		echo "$file is a folder"
	elif [ -f "$file" ]
	then
		echo "$file jest plikiem"
	else
		echo "$file nie istnieje"
	fi
done
