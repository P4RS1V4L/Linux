#!/bin/bash
#
if [ $USER == "rich" ]
then
	echo "witaj, $USER"
	echo "Milego pobytu."
elif [ $USER == "barbara" ]
then
	echo "Czesc, $USER"
	echo "Milo nam Cie powitac."
elif [ $USER == "christine" ]
then
	echo "Hello, $USER"
	echo "Have a nice stay"
elif [ $USER == "tim" ]
then
	echo "Hello, $USER"
	echo "Nice to see you"
elif [ $USER = "testing" ]
then
	echo  "Wyloguj sie przed wyjsciem."
else
	echo "Przykro nam, nie masz tu wstepu."
fi
#
case $USER in
rich | christine)
	echo "Hello, $USER"
	echo "Have a nice stay";;
barbara | tim)
	echo "Hello, $USER"
	echo "We are happy to see you";;
testing)
	echo "Please log off before exit";;
*)
	echo "We are sorry, you have no access here"
esac
