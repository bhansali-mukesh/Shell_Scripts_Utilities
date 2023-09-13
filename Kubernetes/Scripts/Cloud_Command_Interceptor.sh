#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Set Alias "cli" to Point to Cloud_Command_Interceptor.sh instead of Directly Executing Command
#
# Kind of Command Interceptor
# It Extract Country & Location From Given Command
# Adds them in Command Line and Execute
# Update Kubernetes Configuration Files to Update Coutry & Location, If Needed

# Current Script Path
SCRIPT_PATH=`dirname ${0}`

# Import Context Finder
. ${SCRIPT_PATH}/../Library/Cloud/Command_Interceptor.h

Intercept $*
