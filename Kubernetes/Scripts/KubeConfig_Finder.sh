#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Find Kubernetes Configuration File for Given Cluster ID
# Example
#       ./KubeConfig_Finder.sh resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija 
#
# Paramters
#       1. Cluster Id ( Mandatory ), Error Otherwise
#       2. Pod Plane ( CP or DP ) ( Optional )
#               Defaul to DP
#               If Given Anything which Doesn't Conatin "CP" in Any Case ( Say, XYZ etc ), Default to DP

# Control Plane Pod Name Space
CP_NAME_SPACE="omni-control--plane"

# Current Script Path
SCRIPT_PATH=`dirname ${0}`

# Import Context Finder
. ${SCRIPT_PATH}/../Library/Kubernetes/Context_Finder.h

info "KUBECONFIG = $(getKubeConfig $1 $2)"
info
