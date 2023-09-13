#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Current Script Path
MY_PATH=`dirname ${(%):-%N}`

# Import Format Utility
. ${MY_PATH}/../../../Shared/Library/Text/Format.h

OPENSEARCH="opensearch"

function Validate()
{
	if [ -z `echo "${1}" | grep ${OPENSEARCH}` ]
        then
                fatal
		fatal "Parameter is Either EMPTY or NOT a Valid Opensearch Cluster Id"
		warn "Need Cluster ID as Parameter"
                        exit 1
        fi
}

function getCountry()
{
	echo `echo ${1} | cut -d. -f4`
}

function getLocation()
{
	echo `echo ${1} | cut -d. -f5`
}

function getNameSpacePrefix()
{
	echo `echo ${1} | rev | cut -d'.' -f1 | rev`
}
