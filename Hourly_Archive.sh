#!/bin/bash
#
#Hourly_Archive - creates backup every hour
#
#
config_file =/home/christine/archive/hourly/Files_To_Backup.txt
#
#
basedest=/home/christine/archive/hourly
#
day=$(date +%d)
month=$(date +%m)
time=$(date +%k%M)
#
mkdir -p $basedest/$month/$day
#
destination=$basedest/$month/$day/archive$time.tar.gz
if [ -f $config_file ]
then
	echo
else
	echo
	echo "File $config_file does not exists."
	echo "Backup copy cannot be completed."
	echo
	exit
fi
#
file_no=1
exec 0< $config_file
#
while [ $? -eq  0 ]
do
	if [ -f $file_name -o -d $file_name ]
	then
		file_list="file_list $file_name"
	else
		echo
		echo "File $config_file does not exists."
		echo "..."
		echo
	fi
#
	file_no=$[$file_no + 1]
	read file_name
done
#
#
echo "Backup in progress..."
echo
#
tar -czf $destination $file_list 2> /dev/null
#
#
echo "Backup completed"
echo
#
Exit

