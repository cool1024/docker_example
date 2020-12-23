#!/bin/bash

##
# start/stop redis example.
# pay attetion: the shell will clean all data in this project.
##

function clean_redis() {
    rm -rf ./disk/redis*
}

function stop_redis() {
    docker-compose \
        -f ./docker/redis.yaml \
        down
}

function start_redis() {
    docker-compose \
        -f ./docker/redis.yaml \
        up -d

    docker exec redis1.example.com /bin/bash -c './resource/install.sh 1'
    docker exec redis2.example.com /bin/bash -c './resource/install.sh 2'
    docker exec redis3.example.com /bin/bash -c './resource/install.sh 3'
    docker exec redis4.example.com /bin/bash -c './resource/install.sh 4'
    docker exec redis5.example.com /bin/bash -c './resource/install.sh 5'
    docker exec redis6.example.com /bin/bash -c './resource/install.sh 6'
    docker exec -it redis1.example.com /bin/bash -c './resource/cluster.sh'
}

function prepare_redis() {
    mkdir ./disk/redis1
    mkdir ./disk/redis2
    mkdir ./disk/redis3
    mkdir ./disk/redis4
    mkdir ./disk/redis5
    mkdir ./disk/redis6
}

COMMAND_FLAG=$1
COMMAND_FLAG=${COMMAND_FLAG:-"start"}

echo "command params => $COMMAND_FLAG"

case $COMMAND_FLAG in
"start")
    echo "start_redis..."
    stop_redis
    clean_redis
    prepare_redis
    start_redis
    ;;
"clean")
    echo "clean redis..."
    stop_redis
    clean_redis
    ;;
esac
