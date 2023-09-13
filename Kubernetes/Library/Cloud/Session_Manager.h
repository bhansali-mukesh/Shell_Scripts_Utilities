#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Authenticate the CLI Session
# Example
#               Auth
#		Auth uzbek
#		Auth bhutan thimpu
#		export COUNTRY=SPAIN; Auth
#
# Creates CLI Session, If Needed
# Refreshes Session to Set Later Expiry, If Session is Already Valid
# ( CLI Session is Valid for 2 Hours, If Not Refershed )


DEFAULT_COUNTRY=bharat
DEFAULT_LOCATION=pune

function Authenticate_Session()
{
	# If No Parameter is Not Passed and COUNTRY is not Exported in Environment, Authenticate $DEFAULT_COUNTRY
	if [ $# -lt 2 ] && [ -z "${COUNTRY}" ]
	then
		# Default Values
		COUNTRY=${DEFAULT_COUNTRY}
		LOCATION=${DEFAULT_LOCATION}
	else
		COUNTRY=${1}
		LOCATION=${2}
	fi

	# Validate Authentication Session But Don't Create one here
	printf "%s\n" "no" | cli validate session --profile=${COUNTRY}

	if [ $? -ne 0 ]
	then
		# Authenticate Session for $DEFAULT_COUNTRY ( Or Whichever COUNTRY You Want to Authenticate with, You can change below printf inputs accordingly )
		printf "%s\n" "${LOCATION}" "${COUNTRY}" | cli create session --profile ${COUNTRY} --location ${LOCATION}

	else
		cli refresh session --profile ${COUNTRY} --location ${LOCATION}
	fi
}

function Refresh_Session()
{
	if [ $# -lt 1 ]
        then
                # Default Values
                COUNTRY=${DEFAULT_COUNTRY}
        else
                COUNTRY=${1}
        fi

	cli refresh session --profile ${COUNTRY} --location ${LOCATION}
}

function Refresh_Regularly()
{
        if [ $# -lt 1 ]
        then
                # Default Values
                COUNTRY=${DEFAULT_COUNTRY}
        else
                COUNTRY=${1}
        fi

	# Refresh the session for the specified profile Regularly
	while true
	do
  
	  	echo "Sleeping for 1 Hour and 57 Minutes Before Authentication Token Refresh ..."
  		echo "**********************************************************************************************************************************"
  		echo

  		sleep 7000
 
  		echo
  		echo "**********************************************************************************************************************************" 
  		echo "Refreshing Session for : ${COUNTRY}"
  	
		cli refresh session --profile ${COUNTRY}
	done
}
