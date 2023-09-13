#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Current Script Path
SCRIPT_PATH=`dirname ${0}`

# Import Format Utility
. ${SCRIPT_PATH}/Format.h

# Import Format Utility
. ${SCRIPT_PATH}/../Environment.h

function Substitute_Variables()
{
	# Replace Variables with Values, If Value Present and Return
	# Don't Replace if Value is EMPTY or NOT Present
	echo ${1} | envsubst "$(GetAllNonEmptyExportedVariables)"
}
