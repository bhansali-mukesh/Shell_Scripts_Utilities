#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Current Script Path
MY_PATH=`dirname ${(%):-%N}`

# Import Format Utility
. ${MY_PATH}/../Text/Format.h

# Import Map
. ${MY_PATH}/../Object/Map/ZSH/Map.h

# Import Ordered_Map
. ${MY_PATH}/../Object/Map/ZSH/Ordered_Map.h

# Default Input Message
DEFAULT_INPUT_MESSAGE="Input Corrosponding Number"

# Read Property File and Get Value for the Indexed Key
function getProperty()
{
	# Calculate Source Property File
	if [ $# -eq 0 ]
	then
		fatal
		fatal "Parameter Needed for Property File"
		info "Example : ${0} Example.properties"
			exit 1
	else
		SOURCE=${1}
		INPUT_MESSAGE=${2} # Optional
	fi

	# Create Map Object
	Ordered_Map map
	map.populate ${SOURCE}

	if [ -z "${INPUT_MESSAGE}" ] # As This is Optional Parameter
        then
                INPUT_MESSAGE=${DEFAULT_INPUT_MESSAGE}
        fi

	warn
	warn "${INPUT_MESSAGE}"
	warn

	map.keys >&2

	read REQUEST

        if [ -z "${REQUEST}" ]
        then
                # If User Input is Empty, Command is also Empty
                COMMAND=${REQUEST}
        else
		# Get Value From Property Map
		COMMAND=$(map.getByIndex ${REQUEST})

		if [ -z "${COMMAND}" ]
		then
			# If Value Not Found, Consider User Input as Custom Value
			COMMAND=${REQUEST}
		fi
	fi

	# Return Value
	echo ${COMMAND}
}

# Read Property File and Get Value for the Indexed Key
function getPropertyValue()
{
        # Calculate Source Property File
        if [ $# -lt 2 ]
        then
                echo
                fatal "Parameter Needed for Property File"
		warn "1. Property File Name"
		warn "2. Key Name"
                info "Example : ${0} Example.properties Identity"
                        exit 1
        else
                SOURCE=${1}
                KEY=${2}
        fi

        # Create Map Object
        Map map
        map.populate ${SOURCE}

	# Get Key Value
        COMMAND=$(map.get ${KEY})
        
	# Return Value
        echo ${COMMAND}
}

# Read Property File and Get Keys By Pattern
function getKeysByPattern()
{
        # Calculate Source Property File
        if [ $# -lt 2 ]
        then
                echo
                fatal "Parameter Needed for Property File"
                warn "1. Property File Name"
                warn "2. Pattern"
                info "Example : ${0} Example.properties Identity"
                        exit 1
        else
                SOURCE=${1}
                PATTERN=${2}
        fi

        # Create Map Object
        Map map
        map.populate ${SOURCE}

        # Get Key Value
        COMMAND=$(map.displayPatternedKeys ${PATTERN})

        # Return Value
        echo ${COMMAND}
}

# Read Property File and Get Value for a Particular Line
function getPropertyValueByIndex()
{       
	# Calculate Source Property File
        if [ $# -lt 2 ]
        then
                echo
                fatal "Parameter Needed for Property File"
                warn "1. Property File Name"
                warn "2. Line Number"
                info "Example : ${0} Example.properties Identity"
                        exit 1
        else
                SOURCE=${1}
                LINE_NUMBER=${2}
        fi
        
        # Create Map Object
        Ordered_Map map
        map.populate ${SOURCE}
        
        # Get Key Value
        COMMAND=$(map.getByIndex ${LINE_NUMBER})

        # Return Value
        echo ${COMMAND}
}
