#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Get Kubenetes Result from Pods
# Example
#               ./Connector.sh ~/.kube/DEV_MUMBAI_DP resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija DP "ls -l; df -h; free -m"
#
# Paramters
#       1. Kube Config File Path ( Mandatory ), Error Otherwise
#       2. Cluster Id ( Optional ), If Not Passed, Opens Terminal for CP Pod
#       3. Pod Plane ( CP or DP ) ( Optional )
#               If Not Given, If Cluster Id is Present, Set Pod Plane = DP, Otherwise CP
#               If Given Anything which Doesn't Conatin "DP" in Any Case ( Say, XYZ etc ), Default to CP
#       4. Command List ( Optional )
#               Can be Given List of Commands but in Double Quotes ("") Separate them By Semicolon

# Control Plane Pod Name Space
CP_NAME_SPACE="omni-control-plane"

# Container Name
CP_CONTAINER_NAME="omni-control-plane"
DP_CONTAINER_NAME="opensearch"

# Current Script Path
SCRIPT_PATH=`dirname ${0}`

# Import Text Format Utility
. ${SCRIPT_PATH}/../../Shared/Library/Text/Format.h

# Import Kubernetes Informer
. ${SCRIPT_PATH}/../Library/Kubernetes/Informer.h

# Import D Parser
. ${SCRIPT_PATH}/../Library/Kubernetes/Parser.h

# Import Pod Plane Utilities
. ${SCRIPT_PATH}/../Library/Utils/Pod_Plane_Utils.h

function getPodPlaneIfValidParameters()
{
        KUBE=$1
        CLUSTER_ID=$2
        POD_PLANE=$3
	
	if [[ ! -f "$KUBE" ]]
        then
                fatal "Kubenetes Configuration File not Found : ${KUBE}"
                        exit 1
        fi

        if [ ! -z "${CLUSTER_ID}" ]
        then
                # If Cluster Id is NOT EMPTY, Validate it.
                Validate ${CLUSTER_ID}
        fi

	POD_PLANE=$(getPodPlane_DefaultCP_ClusterDefaultDP "${POD_PLANE}" "${CLUSTER_ID}")
	#Debug "POD_PLANE : ${POD_PLANE}"

	if [ "${POD_PLANE}" = DP ] && [ -z "${CLUSTER_ID}" ]
	then
		# If Pod Plane is DP and Cluster Id is EMPTY, Can not Connect
                Debug "KUBE = $KUBE"
        	Debug "CLUSTER_ID = $CLUSTER_ID"
        	Debug "POD_PLANE = $POD_PLANE"
		
		Debug ""
		fatal "Need Cluster ID to Connect to Data Plane"
                	exit 1
	fi
        
	# Return Pod Plane
        echo ${POD_PLANE}
}

function IsConnectable()
{
	if [ $# -lt 3 ]
	then
		Debug "NAME_SPACE = ${1}"
		Debug "POD NAME = ${2}"
		Debug "COMMANDS_OR_CONTAINER_NAME = ${3}"

		fatal "Not Able to Connect"
		warn "Check Name Space, Pod Name and Command Or Container Name Again" >&2
			exit 1
	fi

	echo "YES"
}

KUBE=${1}
CLUSTER_ID=${2}
POD_PLANE=${3}

# All Parameters Starting From 4th
COMMANDS="${@:4}"

POD_PLANE=$(getPodPlaneIfValidParameters $KUBE ${CLUSTER_ID} $POD_PLANE)
#Debug "POD_PLANE = $POD_PLANE"

if [ -z "${POD_PLANE}" ]
then
	fatal "Pod Plane Can not be Determined"
		exit 1
fi

#Debug "POD_PLANE = ${POD_PLANE}"

${SCRIPT_PATH}/Cloud_Authenticator.sh

export KUBECONFIG=${KUBE}
if [ "${POD_PLANE}" = DP ]
then 
	NAME_SPACE_PREFIX=$(getNameSpacePrefix ${CLUSTER_ID})
	
	NAME_SPACE=$(getDataPlaneNameSpace ${NAME_SPACE_PREFIX})
	
	POD_NAME=$(getPodName ${NAME_SPACE} "master-0")

	CONTAINER_NAME=${DP_CONTAINER_NAME}
else
	NAME_SPACE=${CP_NAME_SPACE}

	POD_NAME=$(getPodName ${NAME_SPACE} "omni-control-plane")

	CONTAINER_NAME=${CP_CONTAINER_NAME}
fi

Debug "NAME_SPACE = ${NAME_SPACE}"
Debug "POD_NAME = ${POD_NAME}"
Debug "COMMANDS = ${COMMANDS}"
Debug "CONTAINER_NAME = ${CONTAINER_NAME}"
Debug
IsConnectable=$(IsConnectable ${NAME_SPACE} ${POD_NAME} ${COMMANDS} ${CONTAINER_NAME})
if [ -z "$IsConnectable" ]
then
	fatal "Can not Connect"
	fatal "Please Check Details Again"
		exit 1
fi

if [ ! -z "${COMMANDS}" ]
then
	RESULT=$(getResult ${NAME_SPACE} ${POD_NAME} ${COMMANDS})

	echo "${RESULT}"
else
	info "Opening Shell Terminal ..."
	getTerminal ${NAME_SPACE} ${POD_NAME} ${CONTAINER_NAME}
fi
