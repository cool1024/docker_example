#!/bin/bash

export PATH=$PATH:/var/pinpoint/jdk/bin
export JAVA_HOME=/var/pinpoint/jdk

WORK_PATH=/var/pinpoint
WORK_RESOURCE=/var/pinpoint/resource

HBASE_VERSION=2.4.0
HBASE_DOWNLOAD_URL=https://mirror.bit.edu.cn/apache/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz
HBASE_PATH=$WORK_RESOURCE/hbase-$HBASE_VERSION

PINPOINT_VERSION=2.2.0
PINPOINT_PACKAGES=(agent collector-boot flink-job web-boot)

function download_hbase() {
    TARGET_FILE=$WORK_RESOURCE/hbase.tar.gz
    if [[ ! -f "$TARGET_FILE" ]]; then
        curl $HBASE_DOWNLOAD_URL -o $TARGET_FILE
        tar -xzvf $TARGET_FILE
    fi
}

function start_hbase() {
    cd $HBASE_PATH
    ./bin/start-hbase.sh
    ./bin/hbase shell ./scripts/hbase-create.hbase
    # init database
    # /scripts/hbase-create.hbase
}

function download_pinpoint() {
    for package in ${PINPOINT_PACKAGES[@]}
    do
        DOWNLOAD_URL=https://github.com/pinpoint-apm/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-${package}-${PINPOINT_VERSION}/.tar.gz
        TARGET_FILE=$WORK_RESOURCE/pinpoint-$package.tar.gz
        if [[ ! -f "$TARGET_FILE" ]]; then
            curl $DOWNLOAD_URL -o $TARGET_FILE
            tar -xzvf $TARGET_FILE
        fi
    done
}

function start_pinpoint() {
    
}
