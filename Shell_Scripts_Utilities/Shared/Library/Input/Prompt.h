#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

function User_Confirmation()
{
	if [ $# -ne 0 ]
	then
		MESSAGE=${1}
	else
		MESSAGE="Press Anything to Continue"
	fi
	
	warn
	warn "${MESSAGE}"
	warn

	read CONFIRMATION
}

function User_Input()
{
        if [ $# -ne 0 ]
        then
                MESSAGE=${1}
        else
                MESSAGE="Enter Input Value"
        fi

        warn
	warn "${MESSAGE}"
	warn

        read INPUT

	# Return Value
	echo ${INPUT}
}
