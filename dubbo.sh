#!/bin/bash

##
# DUBBO ENV SHELL
#
# PAY ATTENTION: THIS SHELL WILL CLEAN ALL DATA INT THIS PROJECT.
##

# 清空旧的磁盘文件
rm -rf ./disk/demo
mkdir ./disk/demo
cp demo/out/artifacts/demo_dubbo_main_jar/demo.dubbo.main.jar ./disk/demo
cp jar/dubbo-admin-server-0.2.0-SNAPSHOT.jar ./disk/demo


# 尝试关闭后启动容器
docker-compose  \
-f ./docker/zookeeper.yaml \
-f ./docker/dubbo.yaml \
-f ./docker/client.yaml \
down

# docker-compose \
# -f ./docker/zookeeper.yaml \
# -f ./docker/client.yaml \
# -f ./docker/dubbo.yaml up -d

# docker exec -it zs1.example.com /bin/bash -c './resource/install.sh 1'
# docker exec -it zs2.example.com /bin/bash -c './resource/install.sh 2'
# docker exec -it zs3.example.com /bin/bash -c './resource/install.sh 3'
# docker exec  dubbo2.example.com /bin/bash -c './dubbo-admin.sh'
# docker exec  dubbo1.example.com /bin/bash -c './dubbo.sh'
# docker exec -it dubbo2.example.com /bin/bash -c './dubbo.sh cool1024'