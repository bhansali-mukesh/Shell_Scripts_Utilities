#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# List Available Commands to Choose from
# Example
#               ./Commandor -c resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija -r ~/Productivity_Scripts/Resources/Example.properties -p CP -s Deleting
# 		./Commandor -f index
#
# Paramters
#       1. -c Cluster Id ( Optional )
#               Replaces Value of Variable ${CLUSTER_ID} in Selected Command
#               If Not Passed, Lists Data Plane Commands to Choose From, Otherwise control Plane
#       2. -f String Pattern ( Optional )
#		Searches Property File with Key Pattern Matching Provided Pattern, Case In-Sensitive
#	3. -r Resource Property File Path ( Optional ) 
#               Shows Commands to choose from that file instead of Default
#       4. -p Pod_Plane ( CP or DP ) ( Optional )
#               If Cluster Id is NOT Given, Set to DP
#               If Cluster Id is Given, Set to CP
#       5. -s State ( Optional )
#               State of the Cluster
#               Replaces Value of Variable ${STATE} in Selected Command

# Current Script Path
SCRIPT_PATH=`dirname ${(%):-%N}`

# Default CP Source Property File
CP_COMMAND_SOURCE=${SCRIPT_PATH}/../Resources/Control_Plane.properties

# Default DP Command Source
DP_COMMAND_SOURCE=${SCRIPT_PATH}/../Resources/OpenSearch_API.properties

# User Message for Input
INPUT_MESSAGE="Enter Number for get Corresponding Command Or Enter Customized Command Or Press ENTER to Get into Terminal"

# Import Pod Plane Utilities
. ${SCRIPT_PATH}/../Library/Utils/Pod_Plane_Utils.h

# Import Format Utilities
. ${SCRIPT_PATH}/../../Shared/Library/Text/Format.h

# Import User Prompt Utility
. ${SCRIPT_PATH}/../../Shared/Library/Input/Prompt.h

# Import Property Reader Utilities
. ${SCRIPT_PATH}/../../Shared/Library/File/Property_Reader.h

# Import Text Subtitutoe
. ${SCRIPT_PATH}/../../Shared/Library/Text/Substitutor.h

# Evertything is Optional here :)

# Get Attributed Parameter
while getopts c:f:i:p:r:s: option 
do 
 case "${option}" 
 in
 c) export CLUSTER_ID=${OPTARG};; # Exporting it to make it Available in Environment and it can be replaced later on in Actual Command
 f) FIND_COMMAND=${OPTARG};;
 o) OUTPUT=${OPTARG};;
 p) POD_PLANE=${OPTARG};;
 r) COMMAND_SOURCE=${OPTARG};;
 s) export STATE=${OPTARG};;     # Exporting it to make it Available in Environment and it can be replaced later on in Actual Command
 esac 
done

#Debug "CLUSTER_ID ${CLUSTER_ID}"
#Debug "FIND_COMMAND ${FIND_COMMAND}"
#Debug "STATE ${STATE}"
#Debug "POD PLANE ${POD_PLANE}"
#Debug "COMMAND_SOURCE ${COMMAND_SOURCE}"

POD_PLANE=$(getPodPlane_DefaultDP_ClusterDefaultCP "${POD_PLANE}" "${CLUSTER_ID}")
#Debug "POD PLANE ${POD_PLANE}"

if [ -z "${COMMAND_SOURCE}" ]
then
	# If Pod Plane is Empty
        if [ "${POD_PLANE}" = DP ]
	then
		COMMAND_SOURCE=${DP_COMMAND_SOURCE}
	else
		COMMAND_SOURCE=${CP_COMMAND_SOURCE}
	fi
fi

#Debug COMMAND_SOURCE ${COMMAND_SOURCE}

if [ ! -z "${FIND_COMMAND}" ]
then
        COMMAND=$(getKeysByPattern "${COMMAND_SOURCE}" "${FIND_COMMAND}")
else
	COMMAND=$(getProperty "${COMMAND_SOURCE}" "${INPUT_MESSAGE}")
fi

COMMAND_VALUE=$(Substitute_Variables ${COMMAND})

if [ ! -z "${FIND_COMMAND}" ]
then
	info "${COMMAND_VALUE}"
	INPUT_MESSAGE="Enter Command ( You Can Copy and Paste Desired Command Part From Above Finder Result )"
	COMMAND_VALUE=$(User_Input ${INPUT_MESSAGE})
fi

if [ -z "$OUTPUT" ]
then
        info "${COMMAND_VALUE}"
else
        echo "${COMMAND_VALUE}"
fi
