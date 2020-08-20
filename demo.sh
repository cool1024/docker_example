#!/bin/bash
#
# 启动Demo项目容器
#
# 注意，这个脚本会清空之前保存的所有项目数据
##

# 清空旧的磁盘文件
rm -rf ./disk/demo
mkdir ./disk/demo
cp ./demo/out/artifacts/demo_main_jar/demo.main.jar ./disk/demo


# 尝试关闭后启动容器
docker-compose  \
-f ./docker/zookeeper.yaml \
-f ./docker/demo.yaml \
-f ./docker/client.yaml \
down

docker-compose \
-f ./docker/zookeeper.yaml \
-f ./docker/client.yaml \
-f ./docker/demo.yaml up -d

docker exec -it zs1.example.com /bin/bash -c './install.sh 1'
docker exec -it zs2.example.com /bin/bash -c './install.sh 2'
docker exec -it zs3.example.com /bin/bash -c './install.sh 3'
docker exec -it demo.example.com /bin/bash -c './demo.sh'