#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Authenticate the Cloud Session
# Example
#               ./Cloud_Authenticator.sh
#		./Cloud_Authenticator.sh uzbek
#		./Cloud_Authenticator.sh bharat.pune
#		export USER=thai; ./Cloud_Authenticator.sh
#
# Creates Cloud Session, If Needed
# Refreshes Session to Set Later Expiry, If Session is Already Valid
# ( Cloud Session is Valid for one Hour, If not Refershed )

# Storing Original Value
ORIGINAL_PATH=${SCRIPT_PATH}

# Current Script Path
SCRIPT_PATH=`dirname ${(%):-%N}`

# Import Property Reader Utilities
. ${SCRIPT_PATH}/../../Shared/Library/File/Property_Reader.h

# Import Context Finder
. ${SCRIPT_PATH}/../Library/Cloud/Session_Manager.h

# Location Source for Coutry
COUNTRY_LOCATION=${SCRIPT_PATH}/../Resources/Coutry_Location.properties

# Restore Original Path After Import is Complete
SCRIPT_PATH=${ORIGINAL_PATH}

Coutry=$1
Location=$2

# If Country is Not Passed and Not Exported as Environment Variable
if [ -z "${Coutry}" ] && [ -z "${COUNTRY}" ]
then
	Coutry=bharat
fi

if [ -z "${Location}" ]
then
        Location=$(getPropertyValue ${COUNTRY_LOCATION} ${Coutry})
	if [ -z "${Location}" ]
	then
		fatal "Location is Empty"
		warn "Location is Neither Provided Nor Found in ${COUNTRY_LOCATION}"
			exit 1
	fi
fi

Authenticate_Session ${Coutry} ${Location}
