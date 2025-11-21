#!/bin/bash

#sample system variables
echo "Informations about user: $USER"
echo UID: $UID
echo HOME: $HOME

#user variables
days=10
guest="Katie"
echo "$guest last logged on $days days ago."
days=5
guest="Jessica"
echo "$guest last logged on $days days ago."

value1=10
value2=$value1
echo result: $value2

testing=$(date)
echo "Date & time: " $testing

today=$(date +%y%m%d)
ls /usr/bin -al > log.$today
