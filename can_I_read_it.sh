#!/bin/bash
# script is checking if user can read specific file
#
pwfile=/etc/shadow
echo
echo "checking if it is possible to read $pwfile..."
#
if [ -f $pwfile ]
then
	# file exists so lets see if can be read
	#
	if [ -r $pwfile ]
	then
		echo "displaying end of the file with using tail command"
		tail $pwfile
		#
	else
		echo "no rights to read the $pwfile."
	fi
	#
else
	echo "no rights to read the file"
fi

