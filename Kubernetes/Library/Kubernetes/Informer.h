#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

function Validator()
{
	Actual_Parameters=`expr $# - 2`;
	if [ $Actual_Parameters -lt $1 ];
	then 
		fatal "$2"
			exit 1;
	fi
}

function getDataPlaneNameSpace()
{
	Validator  1 "Need Name Space Prefix" $*
	
	NAME_SPACE_PREFIX=${1}	

	echo `\kubectl get namespaces | grep -Eo "${NAME_SPACE_PREFIX}[0-9]*"`
}

function getPodName()
{
	Validator 2 "Need 2 Parameters ( 1. NAME SPACE, 2. POD PATTERN )" $*

	NAME_SPACE=$1
	POD_PATTERN=$2
	
	echo `\kubectl get pods -o=name --namespace=${NAME_SPACE} | cut -d'/' -f2 | grep -i ${POD_PATTERN} | head -1`
}

function getResult()
{
	Validator 3 "Need 3 Paramters ( 1. NAME SAPCE, 2. POD_NAME, 3. COMMAND )" $*

	NAME_SPACE=$1
        POD_NAME=$2
	COMMAND="$3"

	Debug "kubectl exec --namespace ${NAME_SPACE} ${POD_NAME} -- /bin/bash -c ${COMMAND}"
	RESULT=`\kubectl exec --namespace ${NAME_SPACE} ${POD_NAME} -- /bin/bash -c "${COMMAND}"`
	
	# Return Command Result
	echo $RESULT
}

function getTerminal()
{
	Validator 3 "Need 3 Paramters ( 1. NAME SAPCE, 2. POD_NAME, 3. CONTAINER NAME )" $*

	NAME_SPACE=$1
        POD_NAME=$2
        CONTAINER_NAME=$3

	Debug "exec kubectl exec -i -t -n ${NAME_SPACE} ${POD_NAME} -c ${CONTAINER_NAME} -- sh -c \"clear; (bash || ash || sh)\""
	exec \kubectl exec -i -t -n ${NAME_SPACE} ${POD_NAME} -c ${CONTAINER_NAME} -- sh -c "clear; (bash || ash || sh)"
}
