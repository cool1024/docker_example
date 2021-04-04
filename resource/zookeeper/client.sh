#!/bin/bash
#
# 配置Zookeeper-Client环境
#
export JAVA_HOME=/var/zookeeper/jdk

# 安装相关依赖
# yum install telnet -y

# 启动客户端
/var/zookeeper/bin/zkCli.sh -server zs1.example.com:2181,zs2.example.com:2182,zs3.example.com:2183