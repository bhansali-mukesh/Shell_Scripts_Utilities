#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Add Profile and Auth Parameters in KubeConfig File Under $HOME/.kube Directory
# Example
#               ./UpdateKubeConfig.sh uzbek
# 
# Paramters
#       1. Country ( Optional )
#               If Not Given, Defaults to bharat
#       2. Location ( Optional )
#               If Not Given, Defaults to mum

# Current Script Path
SCRIPT_PATH=`dirname ${0}`

# Import Update Utility for Kubernetes Files
. ${SCRIPT_PATH}/../Library/Kubernetes/UpdateKubeConfig.h

Country=$1
UpdateKubeConfig $Country
