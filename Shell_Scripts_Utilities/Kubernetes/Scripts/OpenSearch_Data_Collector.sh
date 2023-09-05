#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

# Get Cluster Data
# Example
#               export ADMIN_PASSWORD=guHW2fI6cVdrAbQAzrehtryjutykjFgvASqADe395K6Wrhoreiok50XkBSMXP9z2 ( If Authentication is Needed )
#               ./OpenSearch_Data_Collector.sh resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija 
#
# Parameters
#       1. Cluster ID ( Mandatory )
#       	The Cluster, For which We want to get Details

# Original_Path=${SCRIPT_PATH}

# Current Script Path
SCRIPT_PATH=`dirname ${(%):-%N}`

# Import Context Finder
. ${SCRIPT_PATH}/../Library/Kubernetes/Context_Finder.h

# Import ID Parser Utility
. ${SCRIPT_PATH}/../Library/Kubernetes/Parser.h

# Import Kubernetes Informer
. ${SCRIPT_PATH}/../Library/Kubernetes/Informer.h

# Restore Original Path After Import is Complete
SCRIPT_PATH=${Original_Path}

info

if [ $# -eq 0 ]
then
        fatal "Need Cluster Id as Input"
                exit 1
fi

if [ -z "${ADMIN_PASSWORD}" ]
then
        warn "ADMIN_PASSWORD is EMPTY"
	warn "Please set like BELOW for Authentication"
	info "export ADMIN_PASSWORD=<SECRET_VALUE>"
	warn "No Need to Set ADMIN_NAME"
	warn
else
	# Apply Authentication only if ADMIN_PASSWORD is Set
	ADMIN_NAME=' -u admin:'
fi

CLUSTER_ID=${1}
POD_PLANE=DP

info "CLUSTER_ID = ${CLUSTER_ID}"
info "POD_PLANE = ${POD_PLANE}"

KUBE=$(getKubeContext "${CLUSTER_ID}" "${POD_PLANE}")
info "exporting KUBECONFIG = $KUBE"

export KUBECONFIG=${KUBE}

NAME_SPACE_PREFIX=$(getNameSpacePrefix ${CLUSTER_ID})
Debug "NAME SPACE PREFIX : ${NAME_SPACE_PREFIX}"

NAME_SPACE=$(getDataPlaneNameSpace ${NAME_SPACE_PREFIX})
info "NAME SPACE : ${NAME_SPACE}"
info

# Health
info "Health"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_cluster/health?pretty' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

# Indices
info "Indices"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_cat/indices?pretty&v=true&bytes=mb&s=index' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

# Mappings
info "Mappings"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_mapping?pretty' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

# Shards
#kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_cat/shards?pretty&v=true&bytes=mb&s=n' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
#info

# Nodes
info "Nodes"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_cat/nodes?pretty&v=true&bytes=mb&s=n' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

# Aliases
info "Alias"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_cat/aliases?v&pretty' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

# Allocation
info "Allocation"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_cat/allocation?v&pretty' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

# Settings
info "Settings"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_cluster/settings?pretty&include_defaults=false' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

# Tasks
info "Tasks"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_tasks?pretty' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

# ISM Policies
info "ISM Policies"
kubectl exec -n ${NAME_SPACE} master-0 -c opensearch -- sh -c "curl -s -XGET 'https://opensearch-master:9200/_plugins/_ism/policies?pretty' --insecure $ADMIN_NAME$ADMIN_PASSWORD"
info

NUMBER_OF_DATA_NODES=`kubectl get pods -n ${NAME_SPACE} --no-headers | grep "opensearch-data" | wc -l`

echo "Number of data nodes : $NUMBER_OF_DATA_NODES"

CURRENT_NODE=0
while [  $CURRENT_NODE -lt $NUMBER_OF_DATA_NODES ]; 
do
	info "POD - $CURRENT_NODE"
	info
	kubectl exec -n ${NAME_SPACE} data-$CURRENT_NODE -c opensearch -- sh -c "df -h"
	info "----------------------------------------------"
	let CURRENT_NODE=CURRENT_NODE+1 
done

info "------------------------------"
