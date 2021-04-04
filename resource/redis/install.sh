#!/bin/bash

BROKER_ID=$1
REDIS_PATH=/var/redis
REDIS_RESOURCE=/var/redis/resource

echo "Install redis => $BROKER_ID"

source $(dirname $0)/util.sh

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
    cp $REDIS_RESOURCE/redis.conf /var/redis
    openip="redis$BROKER_ID.example.com"
    sed -i "s/7000/700$BROKER_ID/g" /var/redis/redis.conf
    sed -i "s/openip/redis$BROKER_ID.example.com/g" /var/redis/redis.conf
}


function start() {
   echo "start redis..."
   $REDIS_PATH/redis-server $REDIS_PATH/redis.conf &
}

prepare_env
prepare_redis
start