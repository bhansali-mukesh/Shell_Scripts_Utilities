#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# declare an associative array
declare -A properties

# read file line by line and populate the array. Field separator is "="

Map()
{
	. <(sed "s/Object/$1/g" ${RELATIVE_PATH_TO_CALLEE})
}

Object.put()
{
	properties[${1}]="$2"
}

Object.get()
{
	eval echo '${'"properties[$1]"'#hash}'
}

Object.remove()
{
	unset "properties[${1}]"
}

Object.display()
{
        for key value in "${(@kv)properties}"
        do
                echo "$key -> $value"
        done
}

Object.displayPatternedKeys()
{
	PATTERN=${1}
	for key value in "${(@kv)properties}"
	do
		MATCH=`echo $key | grep -i ${PATTERN}`
		if [ ! -z "${MATCH}" ]
		then
			echo "$key -> $value"
		fi
	done
}

Object.clear()
{
	for key value in "${(@kv)properties}"
	do
		echo Removing ${key}
		unset "properties[${(b)key}]"
	done
}

Object.populate()
{
	while IFS='=' read -r key value; do
		properties[${key}]="$value"
	done < "$1"
}

# The Path we give in Import Statement in Calling Script
RELATIVE_PATH_TO_CALLEE=${0}
