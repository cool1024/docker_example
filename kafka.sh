#!/bin/bash

##
# start/stop kafka example.
# pay attetion: the shell will clean all data in this project.
##

function clean_kafka() {
    rm -rf ./disk/zs*
    rm -rf ./disk/kafka
}

function stop_kafka() {
    docker-compose \
        -f ./docker/zookeeper.yaml \
        -f ./docker/kafka.yaml \
        down
}

function start_kafka() {
    docker-compose \
        -f ./docker/zookeeper.yaml \
        -f ./docker/kafka.yaml \
        up -d

    docker exec -it zs1.example.com /bin/bash -c './install.sh 1'
    docker exec -it zs2.example.com /bin/bash -c './install.sh 2'
    docker exec -it zs3.example.com /bin/bash -c './install.sh 3'
    docker exec kfk1.example.com /bin/bash -c './install.sh 1'
    docker exec kfk2.example.com /bin/bash -c './install.sh 2'
    docker exec kfk3.example.com /bin/bash -c './install.sh 3'
}

function prepare_kafka() {
    mkdir ./disk/zs1
    mkdir ./disk/zs2
    mkdir ./disk/zs3
    mkdir ./disk/kafka
}

COMMAND_FLAG=$1
COMMAND_FLAG=${COMMAND_FLAG:-"start"}

echo "command params => $COMMAND_FLAG"

case $COMMAND_FLAG in
"start")
    echo "start_kafka..."
    stop_kafka
    clean_kafka
    prepare_kafka
    start_kafka
    ;;
"clean")
    echo "clean kafka..."
    stop_kafka
    clean_kafka
    ;;
esac
