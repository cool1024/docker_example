#!/bin/bash
#
# 重置ZOOKEEPER-DOCKER容器
#
# 注意，这个脚本会清空之前保存的所有服务器数据
##

# 清空旧的磁盘文件
rm -rf ./disk/zs*
mkdir ./disk/zs1
mkdir ./disk/zs2
mkdir ./disk/zs3

# 尝试关闭后启动容器
docker-compose -f ./docker/zookeeper.yaml -f ./docker/client.yaml down
docker-compose -f ./docker/zookeeper.yaml -f ./docker/client.yaml up -d

docker exec -it zs1.example.com /bin/bash -c './install.sh 1'
docker exec -it zs2.example.com /bin/bash -c './install.sh 2'
docker exec -it zs3.example.com /bin/bash -c './install.sh 3'
# docker exec -it zc.example.com /bin/bash -c './client.sh'
