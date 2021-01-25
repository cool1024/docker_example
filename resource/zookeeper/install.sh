#!/bin/bash

#
export JAVA_HOME=/var/zookeeper/jdk
MYID=$1

WORK_PATH=/var/zookeeper
WORK_RESOURCE=/var/zookeeper/resource

# https://www.apache.org/dyn/closer.lua/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz
# https://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz
ZOOKEEPER_VERSION=3.6.2
ZOOKEEPER_DOWNLOAD_URL=https://mirror.bit.edu.cn/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz
ZOOKEEPER_PATH=$WORK_RESOURCE/apache-zookeeper-bin

function download_tar() {
    DOWNLOAD_URL=$1;
    TARGET_FILE=$2;
    if [[ ! -f "$TARGET_FILE" ]]; then
        curl $DOWNLOAD_URL -o $TARGET_FILE
        tar -xzvf $TARGET_FILE
    fi
}

function download_zookeeper() {
    TARGET_FILE=$WORK_RESOURCE/zookeeper.tar.gz
    download_tar $ZOOKEEPER_DOWNLOAD_URL $TARGET_FILE
}

function start_zookeeper() {
    mkdir /var/zookeeper/data
    cp -rf $ZOOKEEPER_PATH/bin /var/zookeeper/bin
    cp -rf $ZOOKEEPER_PATH/lib /var/zookeeper/lib
    echo $MYID > /var/zookeeper/data/myid
    chmod +x /var/zookeeper/bin/*.sh
    /var/zookeeper/bin/zkServer.sh start
}

download_zookeeper
start_zookeeper
