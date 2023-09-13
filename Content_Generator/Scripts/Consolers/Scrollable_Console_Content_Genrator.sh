#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Parses All CSV in Source Directories
# Note : We can have a Special File named Symbols which will always be parsed first than all other CSVs and That must not Contain any Extention too. ( The name must be Symbols only )
# Generates Console Presentable Scrollable Content From These Sources

if [ $# -lt 1 ]
then
	echo -e "\n\tPlease Specify Directory Containing information CSVs."
	echo -e "\n\t\tExample \n\t\t\t $0 ../../Git/Source/ \n"
	exit
fi

Current_Path=`dirname $0`
$Current_Path/Consoler.sh $1 | less
