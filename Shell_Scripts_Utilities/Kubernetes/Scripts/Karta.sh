#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Get Kubenetes Result from Pods
#       Example :
#                       ./Cloud.sh -c resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija -p CP
# Paramters
#       1. -c Cluster Id ( Optional ),
#               If Not Passed, Just Shows Data Plane Commands and Exits
#               If Given, Defaults to CP
#       2. -f String Pattern ( Optional )
#               Searches Property File with Key Pattern Matching Provided Pattern, Case In-Sensitive
#	3. -p Pod Plane ( Optional ) Either CP or DP         
#	4. -x In Line Command
#
# It Helps on Commands on Showing Appropriate Command Lists
#       a. You Can choose any Number from Given List
#       b. You Can Provide Custom Commands as well
#       c. You Can Press ENTER
# It Enquires Relevant Pod for the Given Command & Shows you Relevant Results
# In Case, You Don't Provide Anything and Just Press Enter, It will take you to Pod Terminal

# Control Plane Pod Name Space
CP_NAME_SPACE="omin-control-plane"

# Container Name
CONTAINER_NAME="opensearch"

# Current Script Path
SCRIPT_PATH=`dirname ${(%):-%N}`

# Import Pod Plane Utilities
. ${SCRIPT_PATH}/../Library/Utils/Pod_Plane_Utils.h

# Import Context Finder
. ${SCRIPT_PATH}/../Library/Kubernetes/Context_Finder.h

# Import Text Format Utility
. ${SCRIPT_PATH}/../../Shared/Library/Text/Format.h

# Import Parser Utility
. ${SCRIPT_PATH}/../Library/Kubernetes/Parser.h

# Import Kubernetes Informer
. ${SCRIPT_PATH}/../Library/Kubernetes/Informer.h

# Get Attributed Parameter
while getopts c:f:o:p:x: option 
do 
 case "${option}" 
 in
 c) export CLUSTER_ID=${OPTARG};; # Exporting it to make it Available in Environment and it can be replaced later on in Actual Command
 f) FIND_COMMAND=${OPTARG};;
 o) OUTPUT=${OPTARG};;
 p) POD_PLANE=${OPTARG};;
 x) COMMAND=${OPTARG};;
 esac 
done

Debug
Debug "POD = \"${POD_PLANE}\" ( INPUT )"
POD_PLANE=$(getPodPlane_DefaultDP_ClusterDefaultCP "${POD_PLANE}" "${CLUSTER_ID}")

info
info "CLUSTER_ID = ${CLUSTER_ID}"
info "POD PLANE = ${POD_PLANE} ( CALCULATED )"

if [ -z "$COMMAND" ]
then
	COMMAND=`${SCRIPT_PATH}/Commandor.sh -o true $*`
fi

info

warn "FIRING BELOW COMMAND :" 
info "${COMMAND}"

KUBE=$(getKubeContext "${CLUSTER_ID}" "${POD_PLANE}")
Debug "KUBECONFIG = ${KUBE}"

if [[ ! -f "$KUBE" ]]
then
	echo
        fatal "Kubebernetes Configuration File Not Found for Cluster : ${CLUSTER_ID}"
	echo
                exit 1
fi

Debug "Running ${SCRIPT_PATH}/Kube_Connector.sh ${KUBE} ${CLUSTER_ID} ${POD_PLANE} ${COMMAND}"

RESULT=`${SCRIPT_PATH}/Kube_Connector.sh ${KUBE} ${CLUSTER_ID} ${POD_PLANE} ${COMMAND}`

info	
warn "Command Result : "
info

if [ -z "$OUTPUT" ]
then
	info "${RESULT}"
else
	echo "${RESULT}"
fi
