#!/bin/bash

##
# start/stop memcached example.
# pay attetion: the shell will clean all data in this project.
##

function clean_memcached() {
    rm -rf ./disk/memcached*
}

function stop_memcached() {
    docker-compose \
        -f ./docker/memcached.yaml \
        down
}

function start_memcached() {
    docker-compose \
        -f ./docker/memcached.yaml \
        up -d

    docker exec memcached1.example.com /bin/bash -c './resource/install.sh 1'
}

function prepare_memcached() {
    mkdir ./disk/memcached1
}

COMMAND_FLAG=$1
COMMAND_FLAG=${COMMAND_FLAG:-"start"}

echo "command params => $COMMAND_FLAG"

case $COMMAND_FLAG in
"start")
    echo "start_memcached..."
    stop_memcached
    clean_memcached
    prepare_memcached
    start_memcached
    ;;
"clean")
    echo "clean memcached..."
    stop_memcached
    clean_memcached
    ;;
esac
