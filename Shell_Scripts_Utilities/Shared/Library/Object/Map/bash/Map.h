#!/bin/bash

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# declare an associative array
declare -A properties

# read file line by line and populate the array. Field separator is "="

Map()
{
	. <(sed "s/Object/$1/g" Map.h)
}

Object.put()
{
	eval properties["$1"]="$2"
}

Object.get()
{
	eval echo '${'"properties[$1]"'#hash}'
}

Object.remove()
{
	unset properties["$1"]
}

Object.display()
{
	for key in "${!properties[@]}"
	do
		echo -e "$key"="${properties[$key]}"
	done
}

Object.clear()
{
	for key in "${!properties[@]}"
	do
		unset properties["$key"]
	done
}

Object.populate()
{
	while IFS='=' read -r key value; do
		properties["$key"]="$value"
	done < "$1"
}
