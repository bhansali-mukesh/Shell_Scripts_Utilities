#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Script Takes an Input File and a Command(s)/Script to Process 1 Line of it.
# It will Process First Record for Example and Does the Time Calculation and Wait for User to Confirm Proceeding
# It will Process all Lines in Input Files with Logic Provided as Second Parameter ( Commands/Script )
# It will Display the Output on Standard Input as well as Store it in a File
# It will Also Convert Multi-Line Output into Comma Separated Single Line Output to Store in CSV ( Excel Like ) File for Better Visualization as well as Program Input
# It will Add Prefix Output With Line Number, So that We can Relate Input to Output
# You can find Examples in ../Data/ Directory
# The Output File Name Can be Seen on Console Output ( Usually Latest in ../Data/Dharta*.csv ) 
#
#       Example :
#                       ./Dharta.sh ../Data/Example_Input_IP_OS_Version.csv 'OS=`echo $line | cut -d"," -f2`; echo $OS'
#                       ./Dharta.sh ../Data/Example_Input_IP_OS_Version.csv "`cat ../Data/Example_Processing_for_IP_OS_Version.sh`"
#
# Paramters
#       1. File Path
#		Input File Path ( Mandatory )
#		This Script will Process Each Line of That
#
#	2. Command(s)
#		Single Command or List of Commands ( Preferred In Single Quotes ), Separated By Semicolon
#		Which Needs to be Executed on Pod
#		We can also Write these Commands in Script and cat that as Parameters
#		As Shown in Example
#
#	Note :
#		Please Note that, We have to use $line as a Place Holder for Each Line
#		The Script will Replace it will Actual Values from Input File in Runtime and Process
#
# 	Note :
#		"echo" will be Considered as Output of Script/Command and Stored in Output File.
#		Please don't use echo for other Purposes like Debugging etc.
#		OR Use "echo MESSAGE >&2 instead"

DATA_PATH="Data"
SCRIPT_PATH=`dirname $0`
Script_File_Name=`basename $0`

# Import Text Format Utility
. ${SCRIPT_PATH}/../Library/Text/Format.h

# Import User Prompt Utility
. ${SCRIPT_PATH}/../Library/Input/Prompt.h

# Import Time Coverter Utility
. ${SCRIPT_PATH}/..//Library/Time/Time_Converter.h

# Create Data Directory, If not Created Already
mkdir -p $SCRIPT_PATH/../$DATA_PATH

# Output File Name
# ScriptName_TimeStamp.csv
Output_File_Name=`echo $Script_File_Name | cut -d. -f1`"_"`date +%s`".csv"

# Out File Path in ../Data
OUTPUT_FILE_PATH="$SCRIPT_PATH"/../"$DATA_PATH"/"$Output_File_Name"

# File to be Processed
INPUT_FILE=$1

# Make Alias to Commands to Process single line of Input
alias COMMANDS=$2

if [ -z "$INPUT_FILE" ] || [ -z "`alias COMMANDS`" ]
then
	fatal
	fatal "Missing Parameter(s)"
	fatal
	
	warn "Needs 2 Parameters"
	warn "1. INPUT_FILE"
	warn "2. COMMAND(s), We can Provide List of Commands as Parameter in Single  Quotes, Commands should be separated by Semicolon"
	warn "   OR We can Write a Separate Script and cat that as Second Parameter"
	warn

	info "Examples :"
	info '            ./Dharta.sh ../Data/Example_Input_IP_OS_Version.csv "`cat ../Data/Example_Processing_for_IP_OS_Version.sh`"'
	info '            ./Dharta.sh ../Data/Example_Input_IP_OS_Version.csv OS=`echo $line | cut -d"," -f2`; echo $OS'
	info

	warn "NOTE : Please use $line as input Place holder for every line in Input File ( See in Example )"
	warn
	
	warn "NOTE : echo will be Considered as Output of Script/Command and Stored in Output File."
	warn "       Please DO NOT use echo for other Purposes like Debugging etc."
	warn '       OR Use "echo MESSAGE >&2" instead'
	warn

		exit 1
fi

if [ ! -f "$INPUT_FILE" ]
then
	fatal
	fatal "$INPUT_FILE is NOT a File"
	fatal
	
	warn "Please check Path and Rectify Before Running Again"
	warn

		exit 1
fi

info
info "OUTPUT_FILE_PATH : ${OUTPUT_FILE_PATH}"
info

# Create/Empting File Before Starting
echo > ${OUTPUT_FILE_PATH}

KUL=`wc -l $INPUT_FILE| tr -s ' ' | cut -d' ' -f2`
PRATHAM=`cat $INPUT_FILE | head -1`

Debug "Number of Input = $KUL"
Debug "First Line of Input = $PRATHAM"

line=$PRATHAM

#Debug "Alias Value Below"
#alias COMMANDS

start_time=`date +%s`          
PARINAAM=`COMMANDS`
end_time=`date +%s`           

PROCESSING_TIME=$(( $end_time - $start_time ))
#Debug "PROCESSING_TIME : $PROCESSING_TIME"

HUMAN_READABLE_TIME=$( SecondsToHumanReadble $PROCESSING_TIME )

warn "OUTPUT BELOW :"
info "$PARINAAM"

info
info "This Took $HUMAN_READABLE_TIME"
info

warn "The Entire Process Will Take Approximately  : $( SecondsToHumanReadble $(( $PROCESSING_TIME * $KUL )) )"
warn

User_Confirmation

start_time=`date +%s`
while read line
do
	i=$(( i + 1 ))
	
	PARINAAM=`COMMANDS`
	
	# Change Multi-Line OPutput to Comma Separated one Line Output
	PARINAAM=`echo $PARINAAM | tr "\n\r" ','`

	# Write to Standard Output as well as Output File
	echo $i,${PARINAAM} | tee -a  ${OUTPUT_FILE_PATH}

done < ${INPUT_FILE}

end_time=`date +%s`

PROCESSING_TIME=$(( $end_time - $start_time ))
HUMAN_READABLE_TIME=$( SecondsToHumanReadble $PROCESSING_TIME )

warn
warn "This Took $HUMAN_READABLE_TIME"
warn
