#!/bin/bash
#
#
# script creates file 
# 1. with name provided as parameter
# 2. set rights to execute it
# 3. open file in Nano editor
#
if [ -z "$1.sh" ]; then
	echo "Error, please provide nmae of the file as parameter."
	echo "Example: ./auto.sh <file_name.sh>"
	exit 1
fi
filename="$1.sh"
touch $filename
echo file $filename has been created
chmod u+x $filename
echo executable rights have been added
nano $filename
exit
