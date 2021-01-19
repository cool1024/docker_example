#!/bin/bash

WORK_PATH=/var/skywalking
WORK_RESOURCE=/var/skywalking/resource
export PATH=$PATH:/var/skywalking/jdk/bin

# https://www.apache.org/dyn/closer.cgi/skywalking/8.3.0/apache-skywalking-apm-8.3.0.tar.gz
# https://mirror.bit.edu.cn/apache/skywalking/8.3.0/apache-skywalking-apm-8.3.0.tar.gz
VERSION=8.3.0
DOWNLOAD_URL=https://mirror.bit.edu.cn/apache/skywalking/${VERSION}/apache-skywalking-apm-${VERSION}.tar.gz
RESOURCE_NAME=apache-skywalking-apm-${VERSION}.tar.gz
LIB_PATH=/var/skywalking/resource/apache-skywalking-apm-bin

function download_skywalking() {
    TARGET_FILE=/var/skywalking/resource/$RESOURCE_NAME
    if [[ ! -f "$TARGET_FILE" ]]; then
        curl $DOWNLOAD_URL -o $TARGET_FILE
        tar -xzvf $TARGET_FILE
    fi
    cp -f $WORK_RESOURCE/application.yml $LIB_PATH/conf
    cp -f $WORK_RESOURCE/webapp.yml $LIB_PATH/webapp
}

function start_ui_server() {
    cd $LIB_PATH
    ./bin/oapService.sh
    ./bin/webappService.sh
}

function start_agent() {
    java -javaagent:$LIB_PATH/agent/skywalking-agent.jar -jar $WORK_PATH/demo.dubbo.main.jar &
    java -javaagent:$LIB_PATH/agent/skywalking-agent.jar -jar $WORK_PATH/demo.dubbo.main.jar cool1024 &
}

# download_skywalking
start_ui_server
start_agent
