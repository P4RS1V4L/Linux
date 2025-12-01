#!/bin/bash
#
#
#script deleting specific user
#
#
function get_answer {
#
unset answer
ask_count=0
#
while [ -z "$answer" ]
do
	ask_count=$[ $ask_count + 1 ]
#
	case $ask_count in
	2)
		echo
		echo "answer the qestion."
		echo
	;;
	3)
		echo
		echo "last chance to answer the question."
		echo
	;;
	4)
		echo
		echo "No answer on the question has been received,"
		echo "script ends."
		echo
		#
		exit
	;;
	esac
#
	if [ -n "$line2" ]
	then
		echo $line1
		echo -e $line2" \c"
	else
		echo -e $line1" \c"
	fi
#
#	60 seconds to provide an answer
	read -t 60 answer
done
# cleaning variables
unset line1
unset line2
#
} #end of get_answer function
#
#
function process_answer {
#
answer=$(echo $answer | cut -c1)
#
case $answer in
y|Y)
# condition if user answer 'yes' - no action to do.
;;
*)
# condition if user answer anything but 'yes', no process will be closed.
	echo
	echo $exit_line1
	echo $exit_line2
	echo
	exit
;;
esac
#
# variables cleaning
unset exit_line1
unset exit_line2
#
} #end of process_answer function
#
#
# end of function definition
# receiving name of account to be checked
echo "Step_1 - confirming account name to be deleted."
echo
line1="provide name of user,"
line2="to be removed."
get_answer
user_account=$answer
#
#confirmation if user provided correct user name to be removed
#
line1="The account to be removed is $user_account."
line2="Are you sure? [y/n]"
get_answer
#
#calling function process_answer
# if user provides different answer than y or no, stop the script
#
exit_line1="As you do not want to remove the account $user_account, "
exit_line2="script has been stopped."
process_answer
#
# test if user_account exists
#
user_account_record=$(cat /etc/passwd | grep -w $user_account)
#
if [ $? -eq 1 ]  #close the script if there is no such account
then
	echo
	echo "Account $user_account cannot be found.  "
	echo "Closing the script..."
	echo
	exit
fi
#
echo
echo
echo "account has been found: "
echo $user_account_record
echo
#
line1="Cofirm if it is correct user account. [y/n] "
get_answer
#
#
#calling process_answer function
# if user provides answer other than yes, script will be closed
#
exit_line1="As you do not want to remove account $user_account, "
exit_line2="script will be closed."
process_answer
#
#searching active processes owned by the account to be removed.
#
echo
echo "Step_2 - searching active processes owned by the account to be removed."
echo
#
ps -u $user_account > /dev/null
case $? in
1)	
	echo "This account has no any active precesses."
	echo
;;
0)	#active processes owned by the account to be removed
	#
	echo "Account $user_account own active processes in the system: "
	ps -u $user_account
	#
	line1="Close listed processes? [y/n]"
	get_answer
	#
	answer=$(echo $answer | cut -c1)
	#
	case $answer in
	t|T) #if user answers "y":
		echo "Closing processes"
		#
		#
		command_1="ps -u $user_account --no-heading"
		#
		command_3="xargs -d \\n /usr/bin/sudo /bin/kill -9"
		#
		$command_1 | gawk '{print $1}' | $command_3
		#
		echo
		echo "Processes have been closed"
	;;
	*)
		echo
		echo "Processes are not closed."
	;;
	esac
;;
esac
######
# list of files owned by the account
echo
echo "Step_3 - searching for files owned by the account to be removed."
echo
#
report_delete=$(date +%y%m%d)
report_file="$user_account"_Files_"$report_date".rpt
#
find / -user $user_account > $report_file 2>/dev/null
#
echo
echo "$report_file is ready"
echo -n "File location: "; pwd
echo
#removing user account
echo
#
line1="User account $user_account will be removed. Are you sure? [y/n]"
get_answer
#
#
#
exit_line1="You pressed no"
exit_line2="script will be stopped"
process_answer
#
userdel $user_account
echo
echo "The account $user_account has been removed."
echo
#
exit
