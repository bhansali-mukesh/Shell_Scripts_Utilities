#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Set Alias "cli" to Point to cli.sh instead of Directly Executing Command
# Example
#               cli refresh session
# Kind of Command Interceptor
# It Extract Country & Location From Given Command
# Adds them in Command Line and Execute
# Update Kubernetes Configuration Files to Update Country & Location, If Needed

# Current Script Path
MY_PATH=`dirname ${(%):-%N}`

# Import Cloud Session_Manager
. ${MY_PATH}/Session_Manager.h

# Import Update Utility for Kubernetes Configuration Files
. ${MY_PATH}/../Kubernetes/UpdateKubeConfig.h

# THINGS IT DO
# 1. Add "profile" & "location" Parameters Before Running Command, If Needed
# 2. Edit Generated KubeConfig to Add "profile" & "location" Parameters


function Intercept()
{
	# Run with More Parameters Like
        # --profile
        # --location
        
	# Loop Through All Parameters
	for parameter in $(echo $* | tr " " "\n")
        do
        	RESOURCE=`echo $parameter | grep resource`
        	if [ ! -z "$RESOURCE" ]
                then
			# Example
			# resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija
			
			# We already know Location is 4th Column, If we separate By Dot
			COUNTRY=`echo $parameter | cut -d'.' -f4`
			
			# We already know Location is 5th Column, If we separate By Dot
                	LOCATION=`echo $parameter | cut -d'.' -f5`
                        break;
                fi
        done
	
	# Authenticate Cloud Session to Connect Cloud Clusters
        Authenticate_Session ${COUNTRY} ${LOCATION}
	
	# If Profile is Empty, Add profile & location Parameters
	if [[ -z "${PROFILE}" ]]
	then
		\cli ${*} --profile $COUNTRY --location $LOCATION;
	else
		# No Need to Add Anything, Just Run Command as Same as Provided
		\cli ${*}
	fi

	# Adding Parameters in Generated KubeConfig for
	# --profile
        # --location
	UpdateKubeConfig $COUNTRY
}
