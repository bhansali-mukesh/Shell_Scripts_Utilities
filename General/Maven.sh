#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Current Directory Path
# This Works only in ZSH
# Other Simple Simple Alternative is
# 	`dirname $0`
# But Above works only you call the script and Not When Some Other Script Calls it/it's function
Mavener=`dirname ${(%):-%N}`

# Open Aliases File for Maven Commands
alias Maven="vi $Mavener/Maven.sh"

# Maven install Command, Skipping Tests
alias install='mvn clean install -DskipTests=true'

# Maven install command with Tests
alias MVN='mvn clean install'
