#! /bin/bash
echo lets compare some strings!
#
string1=Christine
string2=Christina
string3=Christiana
string4=""
#
echo "if Christine = christine ?"
if [ $string1 =  $string4 ]
then
	echo "Christine is equal to christine so comparision is not case sensitive"
else
	echo "Christine is not equal to christine so comparision is case sensitive"
fi
#
echo "if Christine != Christina"
if [ $string1 != $string2 ]
then
	echo "Christine is not equal to Christina"
else
	echo "Christine is equal to Christina, but how it happen?"
fi
#
echo "if Christine < Christiana"
if [ $string1 < $string3 ]
then
	echo "string Christine is shorten than the string Christiana"
else
	echo "string Christine is not shorten than the string Christiana" 
fi
#
echo "if Christine length is bigger than 0"
if [ -n $string1 ]
then
	echo "string1 Christine is longer than 0"
fi
#
echo "if string has lenght equal to 0"
if [ -z $string4 ]
then
	echo "string4 has lenght = 0"
else
	echo "string has lenght !=0"
fi

