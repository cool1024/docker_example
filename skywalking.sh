#!/bin/bash

##
# start/stop skywalking example.
# pay attetion: the shell will clean all data in this project.
##

function clean_skywalking() {
    rm -rf ./disk/skywalking*
}

function stop_skywalking() {
    docker-compose \
        -f ./docker/zookeeper.yaml \
        -f ./docker/skywalking.yaml \
        down
}

function start_skywalking() {
    docker-compose \
        -f ./docker/skywalking.yaml \
        up -d

    docker exec skywalking.example.com /bin/bash -c './resource/install.sh'
}

function prepare_skywalking() {
    mkdir ./disk/skywalking
    cp demo/out/artifacts/demo_dubbo_main_jar/demo.dubbo.main.jar ./disk/skywalking
}

function start_zookeeper() {
    docker-compose \
        -f ./docker/zookeeper.yaml \
        up -d
    docker exec -it zs1.example.com /bin/bash -c './install.sh 1'
    docker exec -it zs2.example.com /bin/bash -c './install.sh 2'
    docker exec -it zs3.example.com /bin/bash -c './install.sh 3'
}

COMMAND_FLAG=$1
COMMAND_FLAG=${COMMAND_FLAG:-"start"}

echo "command params => $COMMAND_FLAG"

case $COMMAND_FLAG in
"start")
    echo "start_skywalking..."
    stop_skywalking
    start_zookeeper
    clean_skywalking
    prepare_skywalking
    start_skywalking
    ;;
"clean")
    echo "clean skywalking..."
    stop_skywalking
    clean_skywalking
    ;;
esac
