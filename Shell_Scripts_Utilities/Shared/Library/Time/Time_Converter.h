#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Store Previous Value to Restore Later
ORGINAL_MY_PATH=$MY_PATH

# Current Script Path
MY_PATH=`dirname ${(%):-%N}`

# Import Format Utility
. ${MY_PATH}/../Text/Format.h

MY_PATH=${ORGINAL_MY_PATH}

SECONDS_IN_MINUTE=60

SECONDS_IN_HOUR=3600

function SecondsToHumanReadble() {

	# Taking only Digits

	if [ -z "$SECONDS" ]
	then
		fatal
		fatal "Need Time in Seconds as Input"
		fatal
			exit 1
	fi

	if [ $1 != "0" ]
	then
        	SECONDS=$(IsNumber $1)
	fi

	if [ $SECONDS -lt 0 ]
	then
		# Make it Positive By Mutipling to -1
		SECONDS=$(( $SECONDS * -1 ))
	fi

	((HOURS=${SECONDS}/$SECONDS_IN_HOUR))
 	((MINUTES=(${SECONDS}%$SECONDS_IN_HOUR)/$SECONDS_IN_MINUTE))
 	((SECONDS=${SECONDS}%$SECONDS_IN_MINUTE))

	echo $HOURS H : $MINUTES M : $SECONDS S
}
