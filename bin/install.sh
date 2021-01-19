#!/bin/bash
#
# 配置Zookeeper-Server环境
#
export JAVA_HOME=/var/zookeeper/jdk

mkdir /var/zookeeper/data
echo $1 > /var/zookeeper/data/myid

chmod +x /var/zookeeper/bin/*.sh
/var/zookeeper/bin/zkServer.sh start