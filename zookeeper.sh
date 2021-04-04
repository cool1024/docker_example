#!/bin/bash

##
# start/stop zs example.
# pay attetion: the shell will clean all data in this project.
##

function clean_zs() {
    rm -rf ./disk/zs*
}

function stop_zs() {
    docker-compose \
        -f ./docker/zookeeper.yaml \
        down
}

function start_zs() {
    docker-compose \
        -f ./docker/zookeeper.yaml \
        up -d

    docker exec -it zs1.example.com /bin/bash -c './resource/install.sh 1'
    docker exec -it zs2.example.com /bin/bash -c './resource/install.sh 2'
    docker exec -it zs3.example.com /bin/bash -c './resource/install.sh 3'
}

function prepare_zs() {
    mkdir ./disk/zs1
    mkdir ./disk/zs2
    mkdir ./disk/zs3
}

COMMAND_FLAG=$1
COMMAND_FLAG=${COMMAND_FLAG:-"start"}

echo "command params => $COMMAND_FLAG"

case $COMMAND_FLAG in
"start")
    echo "start_zs..."
    stop_zs
    clean_zs
    prepare_zs
    start_zs
    ;;
"clean")
    echo "clean zs..."
    stop_zs
    clean_zs
    ;;
esac
