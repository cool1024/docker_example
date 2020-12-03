#!/bin/bash
#
# 配置Zookeeper-Client环境
#
echo 'export JAVA_HOME=/var/zookeeper/jdk' >> /etc/profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
source /etc/profile


java -jar  -Djava.net.preferIPv4Stack=true 'demo.dubbo.main.jar' $1