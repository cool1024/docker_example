#!/bin/bash

##
# Add new node into existing cluster
# ArgOne: new node ip:port (127.0.0.2:7000)
# ArgTwo: any existing node in the cluster ip:port (127.0.0.1:7000)
##
function add_node_into_cluster () {
    originNode = $1
    targetClusterNode = $2
    redis-cli --cluster add-node $originNode $targetClusterNode
}