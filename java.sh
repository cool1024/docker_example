#!/bin/bash

##
# start/stop java example.
# pay attetion: the shell will clean all data in this project.
##

function clean_java() {
    rm -rf ./disk/java
}

function stop_java() {
    docker-compose \
        -f ./docker/java.yaml \
        down
}

function start_java() {
    docker-compose \
        -f ./docker/java.yaml \
        up -d
    docker exec -it java.example.com /bin/bash
}

function prepare_java() {
    mkdir ./disk/java
}

COMMAND_FLAG=$1
COMMAND_FLAG=${COMMAND_FLAG:-"start"}

echo "command params => $COMMAND_FLAG"

case $COMMAND_FLAG in
"start")
    echo "start_java..."
    stop_java
    clean_java
    prepare_java
    start_java
    ;;
"clean")
    echo "clean java..."
    stop_java
    clean_java
    ;;
esac
