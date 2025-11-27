#!/bin/bash
#
#scripts is resposible for archiving files listed in Files_To_Backup.txt
#
#
today=$(date +%y%m%d)
#
backupFile=archive$today.tar.gz
#
config_file=/tmp/scripts/Files_To_Backup.txt
destination=/home/christine/archive/$backupFile
#
#
if [ -f $config_file ]
then
	echo
else
	echo
	echo "File $config_file does not exists."
	echo "Backup copy failed to complete."
	echo
	exit
fi
#
#file_no=1
exec 0< $config_file
#
read file_name
#
while [ $? -eq 0 ]
do
	if [ -f $file_name -o -d $file_name ]
	then
		file_list="$file_list $file_name"
	else
		echo
		echo "The file $file_name does not exist!"
		echo "It will not be added to this archive"
		echo "... backup in progress..."
	fi
#
	file_no=$[$file_no + 1]
	read file_name
done
#
#
echo "..."
echo
#
tar -czf $destination $file_list 2> /dev/null
#
echo "Backup is completed"
echo "Archive file: $destination"
echo
#
Exit
