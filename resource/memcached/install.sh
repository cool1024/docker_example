#!/bin/bash

BROKER_ID=$1
WORK_PATH=/var/memcached
WORK_RESOURCE=/var/memcached/resource

echo "Install memcached => $BROKER_ID"

function compile_memcached() {
    echo "compile memcached"
    tar -xzvf "${WORK_RESOURCE}/memcached-1.6.9.tar.gz"
    cd $WORK_PATH/memcached-1.6.9
    yum -y install gcc automake autoconf libtool libevent libevent-devel make
    ./configure --prefix=/var/memcached/resource/memcached-server
    make && make test
    make install
}

function start_memcached() {
    /var/memcached/resource/memcached-server/bin/memcached -u root -p 11211 -m 64m -vv
}

compile_memcached
start_memcached
