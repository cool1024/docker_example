#!/bin/bash

BROKER_ID=$1
REDIS_PATH=/var/redis
REDIS_RESOURCE=/var/redis/resource

echo "Install redis => $BROKER_ID"

function compile_redis() {
    echo "compile redis"
    tar -xzvf "${REDIS_RESOURCE}/redis-6.0.6.tar.gz"
    mv "${REDIS_RESOURCE}/redis-6.0.6" "$REDIS_PATH/redis"
    cd $REDIS_PATH/redis
    yum -y install gcc automake autoconf libtool make
    make
    cp ./src/redis-server ../
    cp ./src/redis-cli ../
}

function prepare_redis() {
    echo "prepare redis"
    cp ./resource/redis-server /var/redis
    cp ./resource/redis-cli /var/redis
}


function start() {
   echo "start redis..."
   $REDIS_PATH/redis-server $REDIS_RESOURCE/redis.conf &
}

prepare_redis
start
