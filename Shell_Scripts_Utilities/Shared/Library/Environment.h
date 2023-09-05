#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

function GetAllNonEmptyExportedVariables()
{
	for variable in `env | cut -d = -f 1`;
	do
		value=`echo ${(P)variable}`;

		# If Value is not Null
		if [ ! -z $value ]
		then
			echo "$"${variable}
		fi
	done;
}

