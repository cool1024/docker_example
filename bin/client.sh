#!/bin/bash
#
# 配置Zookeeper-Client环境
#
# echo 'export JAVA_HOME=/var/zookeeper/jdk' >> /etc/profile
# source /etc/profile


/var/zookeeper/bin//zkCli.sh -server zk1.examle.com:2181,zk2.examle.com:2181,zk3.examle.com:2181