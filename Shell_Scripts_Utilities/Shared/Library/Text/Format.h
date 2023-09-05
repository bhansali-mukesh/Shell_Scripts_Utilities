#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\e[1;33m'
NC='\033[0m' # No Color

function fatal() {
  printf "${RED}%s\n${NC}" $* >&2
}

function warn() {
  printf "${BLUE}%s\n${NC}" $* >&2
}

function info() {
  printf "${GREEN}%s\n${NC}" $* >&2
}

function getUnFormattedText()
{
	echo `echo ${1} | sed  's/\x1b\[[0-9;]*m//g'| col -b`
}

function Debug()
{
	 printf "${YELLOW}%s\n${NC}" $* >&2
}

function IsNumber()
{
	if ! [[ $1 =~ '^[0-9]+$' ]]
	then
		fatal
		fatal "$1 is NOT a Number"
		fatal
			exit 1
	fi

	# Retrun Same Value
	echo $1
}
