#! /bin/bash

value1=10
value2=11

echo "lets check if value1 is larger than value2"
#
if [ $value1 -gt 5 ]
then
	echo "Value $value1 is gether than 5."
fi
#
echo "lets check if value1 is equal to value2."
if [ $value1 -eq $value2 ]
then
	echo "value1 and value2 are equal."
else
	echo "value1 and value2 are not equal."
fi
#
echo "lets check if  value1 is larger than value2 or if is equal"
if [ $value1  -ge $value2 ]
then
	echo  "value1 and value2 are equal."
else
	echo "value1 is not equal or is not larger than value2"
fi
#
echo "checking if value1 is smaller than value2 or if is equal"
if [ $value1 -le $value2 ]
then
	echo "value1 is smaller or equal to value2"
else
	echo "value1 is not smaller or equal to value2"
fi
#
echo "checking if value1 is smaller than value2"
if [ $value1 -lt $value2 ]
then
	echo "value1 is smaller than value2"
else
	echo "value1 is not smaller than value2"
fi
#
echo "checking if value1 is different than value2"
if [ $value1 -ne $value2 ]
then
	echo "value1 is not equal to value2"
else
	echo "value1 is equal to value2"
fi
