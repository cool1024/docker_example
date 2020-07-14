#!/bin/bash
#
# 重置ZOOKEEPER-DOCKER容器
#
# 注意，这个脚本会清空之前保存的所有服务器数据
##

# 清空旧的区块旧文件
rm -rf ./disk/*
mkdir ./disk/zs1
mkdir ./disk/zs2
mkdir ./disk/zs3

# 尝试关闭后启动容器
docker-compose -f ./docker/zookeeper.yaml down
docker-compose -f ./docker/zookeeper.yaml up -d

docker exec -it zs.example1.com /bin/bash -c './install.sh 1'
docker exec -it zs.example2.com /bin/bash -c './install.sh 2'
docker exec -it zs.example3.com /bin/bash -c './install.sh 3'