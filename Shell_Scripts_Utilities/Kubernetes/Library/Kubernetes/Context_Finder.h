#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Kube Configs Parent Directory Path
STARTING_PATH="$HOME/.kube"

# Control Plane Pod Name Space
CP_NAME_SPACE="omni-control-plane"

# Storing the Original Value
Current_File_Name=${File_Name}

ME=${(%):-%N}
File_Name=`basename $ME|cut -d. -f1`

# File Name as Variable Name
# Current Script Path as Value
eval "${File_Name}"=`dirname ${ME}`

# Import Pod Utilities
. ${(P)${File_Name}}/../Utils/Pod_Plane_Utils.h

# Import Parser Utility
. ${(P)${File_Name}}/Parser.h

# Import Format Utility
. ${(P)${File_Name}}/../../../Shared/Library/Text/Format.h

# Import CLI Session_Manager
. ${(P)${File_Name}}/../Cloud/Session_Manager.h

# Import Kubernetes Informer
. ${(P)${File_Name}}/Informer.h

# Restore the Original Value
File_Name=${Current_File_Name}

function getKubeContext()
{
	if [ $# -lt 1 ]
	then
		fatal
		fatal "Need At Least 1 Parameter."
		fatal
	
		warn "Valid Parameters and Usage"
		warn "1. Cluster Id ( ${RED} Required ${NC} )"  >&2
		warn "2. CP/DP ( ${GREEN} Optional ${NC}, Control Plane Pod or Data Plane Pod, ${GREEN}Default is DP${NC})"  >&2
		warn
			exit 1
	fi

	CLUSTER_ID="${1}"

	# Check Whether it is a Valid Opensearch Cluster ID
	Validate ${CLUSTER_ID}
	
	POD_PLANE=$(getPodPlane_DefaultCP ${2})
	# Extracting Namspace Prefix for Data Plane Cluster from Cluster Id
	# Control Plane has Fixed Name Space, i. e. CP_NAME_SPACE="omni-control-plane"
	if [ ${POD_PLANE} = "DP" ]
	then
		NAME_SPACE_PREFIX=$(getNameSpacePrefix)
	else
		NAME_SPACE=${CP_NAME_SPACE}
	fi

	COUNTRY=$(getCountry ${CLUSTER_ID})
	LOCATION=$(getLocation ${CLUSTER_ID})

	# Authenticate CLI Session to Connect Clusters
	Authenticate_Session ${COUNTRY} ${LOCATION}

	CONTEXT=""
	for context in `grep -lr ${LOCATION} ${STARTING_PATH} | grep -v cache`
	do
		#Debug "${context}"
	
		IS_EXPECTED_COUNTRY=`grep -l ${COUNTRY} ${context}`
	
		if [ -z "${IS_EXPECTED_COUNTRY}" ]
		then
			continue;
		fi

		export KUBECONFIG=${context}
		if [ ${POD_PLANE} = DP ]
		then
			NAME_SPACE=$(getDataPlaneNameSpace ${NAME_SPACE_PREFIX})
			if [ ! -z "${NAME_SPACE}" ]
                	then
				CONTEXT=${context}
				break;
                	fi
		else
			CP_POD=$(getPodName ${NAME_SPACE} "omni-control-plane")

			# Empty If it is not an CP Cluster
			if [ ! -z "${CP_POD}" ]
			then
				# Validation is Required as this Control Plane Pod May be from Different Tenancy ( DEV instead of PROD etc. )
				VALIDATION="curl -sk https://127.0.0.1:24444/20180828/cp/cluster/${CLUSTER_ID} | jq '.name'"

				NAME=$(getResult ${NAME_SPACE} ${CP_POD} ${VALIDATION})
				NAME=$(getUnFormattedText ${NAME})

				# Returns "null", If It Doesn't Manage Given Data Plane Cluster ( In Case of Different Tenancy or Cluster doesn't Exist, Deleted etc. )
				if [ "${NAME}" != "null" ]
				then
					CONTEXT=${context}
					break;	
				fi
			fi
		fi
	done

	# Return Value
	echo ${CONTEXT}
}

function getKubeConfig()
{
        CLUSTER_ID=${1}
        POD_PLANE=$(getPodPlane_DefaultDP "${2}")

        info
        info "CLUSTER_ID = ${CLUSTER_ID}"
        info "POD_PLANE = ${POD_PLANE}"
        info

        KUBE=$(getKubeContext "${CLUSTER_ID}" "${POD_PLANE}")

        if [ -z "$KUBE" ]
        then
                info
                fatal "Kube Config Not Found."
                info
                        exit 1
        fi

	info
        # Return Value
        echo $KUBE
}
