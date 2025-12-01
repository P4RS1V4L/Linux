#!/bin/bash
#
# files and accounts monitoring script
#
## variables ##
#
runAccountAudit="false"
runPermAudit="false"
#
reportDir="/home/christine/scripts/AuditReports"
#
while getopts :Ap opt
do
	case "$opt" in
		A) runAccountAudit="true" ;;
		p) runPermAudit="true" ;;
		*) echo "Inappropriate option."
		   echo "Available options: -A, -p, -Ap"
		   exit
		;;
	esac
done
#
### if no options ####
#
if [ $OPTIND -eq 1 ]
then
	#No option passed. All will be set "true".
	runAccountAudit="true"
	runPermAudit="true"
fi
#
### Specific audits ####
# account audit #
if [ $runAccountAudit = "true" ]
then
	echo
	echo "******* Accounts audit ***********"
#
# check of number accounts with shell false/nologin
#
	echo "Actual number of accounts with shell false/nologin:  "
#
	reportDate="$(date +%F%s)"
	accountReport=$reportDir/AccountAudit$reportDate.rpt
#
	#creating report
	cat /etc/passwd | cut -d: -f7 |
	grep -E "(nologin|false)" | wc -l |
	tee $accountReport
#
	#changing file attribute
	sudo chattr +u $accountReport
#
#presenting previous number of shells false/nologin
#
	prevReport="$(ls -t $reportDir/AccountAudit*.rpt | sed -n '2p')"
	if [ -z $prevReport ]
	then
		echo
		echo "No previous report about shells false/nologin to compare."
	else
		echo
		echo "Number of shells false/nologin in previuos report: "
		cat $prevReport
	fi
fi
#
#
## Permission audit ###
echo "Permission audit"
#
if [ $runPermAudit = "true" ]
then
	echo
	echo "******Audit SUID/SGID ******"
	echo
	reportDate="$(date +%F%s)"
	permReport=$reportDir/PermissionAudit$reportDate.rpt
#
	#creating current report
	echo "Report creation. It may take a while..."
	sudo find / -perm /6000 >$permReport 2>/dev/null
#
	#attributes change
	sudo chattr +u $permReport
#
#comparing with pervious report about permissions
#
	#
	prevReport="$(ls -t $reportDir/PermissionAudit*.rpt | sed -n '2p')"
	#
	if [ -z $prevReport ]
	then
		echo
		echo "No previous report about permissions to compare."
	else
		echo
		echo "Difference between current and previous report: "
		#
		differences=$(diff $permReport $prevReport)
		#
		if [ -z "$differences" ]
		then
			echo "No differences."
		else
			echo $differences
		fi
	fi
fi
#
exit
