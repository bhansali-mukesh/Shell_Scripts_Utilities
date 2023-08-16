#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Current Directory Path
# This Works only in ZSH
# Other Simple Simple Alternative is
# 	`dirname $0`
# But Above works only you call the script and Not When Some Other Script Calls it/it's function
Customer=`dirname ${(%):-%N}`

# Open Custom File for Utilities and Aliases
alias Custom="vi ${Customer}/Custom.sh"

                # Utility Function

# Validate Number of Input Provided
# Displays Provided Message $2, If Parameter Counts are Less
# Mostly Used Within some Script Where Parameter Count Validation is Needed
# Example
#               Validator 3 "Parameter Needed ( Name, Surname, Location)"
function Validator()
{
	actual_parameters=`expr $# - 2`
	if [ $actual_parameters -lt $1 ]
	then
	echo -e "\t $2" >&2;
		echo return;
	fi
}

# Confirms Whether User Wants to Continue
# Mostly Used Within some Script Where User Confirmation is Needed
# Example
#		Confirmer
function Confirmer() 
{
	echo -e "\n\t Press \"Y\" to Continue\n" >&2;
	read confirm;

	if [ "$confirm"T != "YT" ]
	then
		echo -e "\t Action Cancelled\n" >&2;
		echo return
	 fi
}


		# Repository Short Cuts

# Go to Jack Hammer Repository
alias Hammer='cd ~/Repositories/Jack_Hammer'

# Go to Gecko Search Repository
alias Gecko='cd ~/Repositories/Gecko'

# Go to Console Repository
alias Console='cd ~/Repositories/Forest-console'

# Go to Image Repository
alias Image='cd ~/Repositories/Imagine'
