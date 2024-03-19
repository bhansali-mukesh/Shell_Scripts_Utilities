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

#Storing Original Value
ORIGINAL_PATH=${SCRIPT_PATH}

# Current Script Path
SCRIPT_PATH=`dirname ${(%):-%N}`

# Import Property Reader Utilities
. ${SCRIPT_PATH}/../../../Shared/Library/File/Property_Reader.h

# Import Metadat Reader Utilities
. ${SCRIPT_PATH}/../../../Shared/Library/File/Metadata.h

# Location Source for Country
COUNTRY_LOCATION=${SCRIPT_PATH}/../../Resources/Country_Location.properties

SCRIPT_PATH=${ORIGINAL_PATH}

# Authentication Client Validation Directory
AUTH_DIRECTORY=${KUBER}"/.Authentication"

function set_Country()
{
        DEFAULT_COUNTRY=oc1

        if [ $# -lt 1 ] && [ -z "${COUNTRY}" ]
        then
                # Default Values
                export COUNTRY=${DEFAULT_COUNTRY}
        elif  [ $# -ge 1 ]                      # Don't Assign If Nothing is Passed But $COUNTRY is exported
        then
                export COUNTRY=${1}
        fi
}

function set_Location()
{
        if [ $# -lt 1 ]
        then
                # Default Values
                export Location=$(getPropertyValue ${COUNTRY_LOCATION} ${COUNTRY})

                if [ -z "${Location}" ]
                then
                        fatal "Location is Empty"
                        warn "Location is Neither Provided Nor Found in ${COUNTRY_LOCATION}"
                                exit 1
                fi
        else
                export Location=${1}
        fi
}

# Private Function
function _authenticate()
{
        # Authenticate Session for $DEFAULT_COUNTRY ( Or Whichever COUNTRY You Want to Authenticate with, You can change below printf inputs accordingly )
        # printf "%s\n" "${Location}" "${COUNTRY}" | oci session authenticate --profile ${COUNTRY} --auth security_token

        # This way is Better as Many Locations are not Available in Pop-up

        #\oci session authenticate --config-location ${HOME}/.oci/config_${COUNTRY}_generated --profile-name ${COUNTRY} --region ${Location} --profile ${COUNTRY} --auth security_token
        \oci session authenticate --config-location ${HOME}/.oci/config --profile-name ${COUNTRY} --region ${Location} --profile ${COUNTRY} --auth security_token

        if [ $? -eq 0 ]
        then
                touch ${AUTH_DIRECTORY}"/"${COUNTRY}
        fi
}

# Private Function
function _refresh()
{
        \oci session refresh --profile ${COUNTRY} --auth security_token

        if [ $? -eq 0 ]
        then
                touch ${AUTH_DIRECTORY}"/"${COUNTRY}
        fi
}

# Private Function
function _terminate()
{
        oci session terminate --auth security_token --profile ${COUNTRY}

        rm -f ${AUTH_DIRECTORY}"/"${COUNTRY}
}

function Authenticate_Session()
{
        # If No Parameter is Passed and COUNTRY is not Exported in Environment, Authenticate $DEFAULT_COUNTRY

        set_Country ${1}
        set_Location ${2}

        #echo COUNTRY = ${COUNTRY}

        # Validate Authentication Session But Don't Create one here
        # printf "%s\n" "n" | \oci session validate --profile=${COUNTRY}

        AUTH_FILE=${AUTH_DIRECTORY}"/"${COUNTRY}

        if [ -f ${AUTH_FILE} ]
        then
                # Current Time - Last Authenticated, In Minutes
                MINUTES_SINCE_LAST_AUTH=$(Minute_Since_Last_Update ${AUTH_FILE})

                if [ ${MINUTES_SINCE_LAST_AUTH} -gt 59 ]
                then
                        _authenticate
                elif [ ${MINUTES_SINCE_LAST_AUTH} -gt 40 ]
                then
                        _refresh
                fi
        else
                _authenticate
        fi

}

function Refresh_Regularly()
{
        set_Country ${1}

        # Refresh the session for the specified profile every 10 minutes
        while true
        do

                echo "Sleeping for 3500 Seconds Before Authentication Token Refresh ..."
                echo "**********************************************************************************************************************************"
                echo

                sleep 3500

                echo
                echo "**********************************************************************************************************************************"
                echo "Refreshing Session for : ${COUNTRY}"

                \oci session refresh --profile ${COUNTRY} --auth security_token
        done
}

function Terminate_Session()
{
        set_Country ${1}
        _terminate
}

function Restart_Session()
{
        set_Country ${1}
        set_Location ${2}

        _terminate
        _authenticate
}
