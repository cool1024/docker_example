#!/bin/bash

BROKER_ID=$1
KAFKA_PATH=/var/kafka
KAFKA_CONFIG_PATH="$KAFKA_PATH/server_$1.properties"

function prepare_java() {
    echo "export JAVA_HOME=$KAFKA_PATH/jdk" >>/etc/profile
    echo 'export PATH=$PATH:$JAVA_HOME/bin' >>/etc/profile
    source /etc/profile
}

function prepare_config() {
    mkdir /var/kafka/logs_$BROKER_ID
    sed "s/BROKER_ID/$BROKER_ID/g" $KAFKA_PATH/config/server.properties > $KAFKA_CONFIG_PATH
}

function start() {
    # /var/kafka/bin/kafka-server-start.sh -daemon $KAFKA_CONFIG_PATH
    # /var/kafka/bin/kafka-server-stop.sh
    $KAFKA_PATH/bin/kafka-server-start.sh -daemon $KAFKA_CONFIG_PATH
}

prepare_java
prepare_config
start
