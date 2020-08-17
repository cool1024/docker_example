#!/bin/bash
#
# 关闭所有容器
#
##

docker-compose -f ./docker/zookeeper.yaml -f ./docker/demo.yaml -f ./docker/client.yaml down