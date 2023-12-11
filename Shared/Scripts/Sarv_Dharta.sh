#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Calls Dharta Multiple Times for Each Input Files in a Directory
#
#       Example :
#                       ./Sarv_Dharta.sh ~/Inputs/ ../Data/Example.sh
#
# Paramters
#       1. Input Directory
#               Input Directory Path ( Mandatory )
#               This Script will Pass Each File to Dharta.sh for Further Processing of Input Files from Given Directory, Excluding Directories in it, Processing Just Files
#       2. Shell Script
#               A Shell Script to Process Each Line of Input Files

SARV_PATH=`dirname $0`

# Import Text Format Utility
. ${SARV_PATH}/../Library/Text/Format.h

# Import User Prompt Utility
. ${SARV_PATH}/../Library/Input/Prompt.h

# Import Time Coverter Utility
. ${SARV_PATH}/../Library/Time/Time_Converter.h

INPUT_DIRECTORY=${1}
LOGIC_FILE=${2}

if [ ! -d "$INPUT_DIRECTORY" ]
then
        fatal
        fatal "$INPUT_DIRECTORY is NOT a Directory"
        fatal

        warn "Please Provide Directory as Input"
	warn "Please Check the Path Before Running Again"
        warn

                exit 1
fi

if [ ! -f "$LOGIC_FILE" ]
then
        fatal
        fatal "$LOGIC_FILE is NOT a File"
        fatal

        warn "Please Provide Script as Logic File"
        warn "Please Check the Path Before Running Again"
        warn

                exit 1
fi

echo
echo
info "INPUT_DIRECTORY = $INPUT_DIRECTORY"
info "LOGIC_FILE = $LOGIC_FILE"
echo
echo

for INPUT_FILE in `ls $INPUT_DIRECTORY`
do
	INPUT_FILE_PATH="$INPUT_DIRECTORY/$INPUT_FILE"
	if [ -f "$INPUT_FILE_PATH" ]
	then
		info "Processing $INPUT_FILE"
		$SARV_PATH/Dharta.sh $INPUT_FILE_PATH "`cat $LOGIC_FILE`"
	else
		warn "Skipping $INPUT_FILE as It is NOT Valid File"
	fi
done

echo
info "SARV COMPLETED"
echo
