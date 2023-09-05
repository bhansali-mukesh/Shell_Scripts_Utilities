#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Current Script Path
MY_PATH=`dirname ${(%):-%N}`

# Import Format Utility
. ${MY_PATH}/../../../Shared/Library/Text/Format.h

SCRIPT_FILE_NAME=`basename ${0}`

STARTING_PATH="$HOME/.kube"

function UpdateKubeConfig()
{
        Country=$1
	
	# Change All Eligible Files Recursively, Excluding Cache Files
	for KUBE_CONFIG in `find ${STARTING_PATH} -type f | grep -v cache`
	do
		# Debug "${KUBE_CONFIG}"

		# If It is a File
		if [[ -f ${KUBE_CONFIG} ]]
		then
			# Don't Edit this Script
			if [[ ${SCRIPT_FILE_NAME} != ${KUBE_CONFIG} ]]
			then
				# Whether Environment is Present ( Indicates A Valid KubeConfig File )
            			ENV=`grep env ${KUBE_CONFIG}`

				# Whether PROFILE is EMPTY
				PROFILE=`grep profile $KUBE_CONFIG`;
			
				# If A Valid KubeConfig File & PROFILE is Not Added, Then Add
            			if [ ! -z "${ENV}" ] && [ -z "${PROFILE}" ]
				then
					# If Country is EMPTY, Get From the File itself
					if [ -z "${Country}" ]
					then
						Country=`grep -F '.cluster.' ${KUBE_CONFIG} | cut -d. -f4`
						Location=`grep -F '.cluster.' ${KUBE_CONFIG} | cut -d. -f5`
					fi

					info "Updating ${KUBE_CONFIG}"
sed '/.*env.*/i \
      - --profile \
      - '$Country' \
      - --location \
      - '$Location' \
' ${KUBE_CONFIG} > temp.tmp; mv temp.tmp ${KUBE_CONFIG}
				fi
			fi
		fi

	done
}
