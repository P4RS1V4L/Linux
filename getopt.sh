#!/bin/bash
#getopt usage example
set -- $(getopt -q ab:cd "$@")
#
echo
while  [ -n "$1" ]
do
	case "$1" in
		-a) echo "Option -a found" ;;
		-b) param=$2
			echo "Option -b found with param $param"
			shift;;
		-c) echo "Option -c found" ;;
		--) shift
			break;;
		*) echo "$1 is not an option" ;;
	esac
	shift
done
#
echo
count=1
for param in $@
do
	echo "Parametr $count: $param"
	count=$[ $count + 1 ]
done
exit

