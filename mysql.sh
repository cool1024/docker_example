#!/bin/bash

function clean_mysql() {
    rm -rf ./disk/mysql
}

function stop_mysql() {
    docker-compose \
        -f ./docker/mysql.yaml \
        down
}

function start_mysql() {
    docker-compose \
        -f ./docker/mysql.yaml \
        up -d
    # docker exec -it mysql.example.com /bin/bash -c './resource/install.sh'
}

function prepare_mysql() {
    mkdir ./disk/mysql
}

COMMAND_FLAG=$1
COMMAND_FLAG=${COMMAND_FLAG:-"start"}

echo "command params => $COMMAND_FLAG"

case $COMMAND_FLAG in
"start")
    echo "start_mysql..."
    stop_mysql
    clean_mysql
    prepare_mysql
    start_mysql
    ;;
"clean")
    echo "clean mysql..."
    stop_mysql
    clean_mysql
    ;;
esac
