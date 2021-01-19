#!/bin/bash

WORK_PATH=/var/skywalking
WORK_RESOURCE=/var/skywalking/resource

# https://www.apache.org/dyn/closer.cgi/skywalking/8.3.0/apache-skywalking-apm-8.3.0.tar.gz
# https://mirror.bit.edu.cn/apache/skywalking/8.3.0/apache-skywalking-apm-8.3.0.tar.gz
VERSION=8.3.0
DOWNLOAD_URL=https://mirror.bit.edu.cn/apache/skywalking/${VERSION}/apache-skywalking-apm-${VERSION}.tar.gz
RESOURCE_NAME=apache-skywalking-apm-${VERSION}.tar.gz

function download_skywalking() {
    $TARGET_FILE=/var/skywalking/resource/$RESOURCE_NAME
    if [[ ! -f "$TARGET_FILE" ]]; then
        curl $DOWNLOAD_URL -o $TARGET_FILE
    fi
}

download_skywalking
