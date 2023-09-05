#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

Current_File_Name=${File_Name}

ME=${(%):-%N}
File_Name=`basename $ME|cut -d. -f1`

# File Name as Variable Name
# Current Script Path as Value
eval "${File_Name}"=`dirname ${ME}`

# Import Format Utility
. ${(P)${File_Name}}/../../../Shared/Library/Text/Format.h

File_Name=${Current_File_Name}

function getPodPlane_DefaultDP_ClusterDefaultCP()
{
        POD_PLANE=$1
        CLUSTER_ID=$2

        # If Pod Plane is Empty
        if [ -z "${POD_PLANE}" ]
        then
                if [ -z "${CLUSTER_ID}" ]
                then
                        echo DP
                else
                        echo CP
                fi

        # If Anything Containing cP in Any Case is Provided as Parameter
        elif [ ! -z `echo ${POD_PLANE} | grep -i Cp` ]
        then
                echo CP
        else
                echo DP
        fi
}

function getPodPlane_DefaultCP_ClusterDefaultDP()
{
	POD_PLANE=$1
        CLUSTER_ID=$2

	if [ -z "${POD_PLANE}" ]
        then
                      
                if [ -z "${CLUSTER_ID}" ]
                then
                        # If Pod Plane is EMPTY and Cluster Id is also EMPTY
                        echo CP
                else
                        # If Pod Plane is EMPTY but Cluster Id is also NOT EMPTY
                        echo DP
                fi
        elif [ -z `echo ${POD_PLANE} | grep -i dP` ]
        then
                # If Pod Plane is NOT EMPTY and Pod Plane is NOT Containing DP in Any Case
                echo CP
        else
                # If Pod Plane is NOT EMPTY and Pod Plane is Containing DP in Any Case
                echo DP
        fi
}

function getPodPlane_DefaultCP()
{
	DP=`echo ${1} | grep -i DP`
        if [ ! -z "${DP}" ]
        then
                POD_PLANE="DP"
        else
                POD_PLANE="CP"
        fi
	# Return Value 
	echo ${POD_PLANE}
}

function getPodPlane_DefaultDP()
{
	CP=`echo ${1} | grep -i cp`
	if [ ! -z "${CP}" ]
	then
        	echo CP
	else
		echo DP
	fi
}
