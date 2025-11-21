#! /bin/bash

# testing if variable has any value assigned
my_variable=""
#
if test $my_variable
then
	echo "Variable my_variable has value assigned and returns true"
	echo "Value my_variable: $my_variable"
else 
	echo "Variable my_variable does not have any value assigned"
	echo "and returns false."
fi

