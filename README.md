# Zookeeper Docker Example

## 运行前准备

1. Java环境复制<br><br>
将JAVA SDK文件夹放在项目根目录下，并重命名该文件夹为jdk

2. Zookeeper库文件复制<br><br>
将Zookeeper所需的所有jar包文件放在项目的zookeeper/lib目录中

3. Docker运行环境(需要docker-compose工具)

## 运行测试

1. 启动测试容器集群 `sudo ./reset.sh`

2. 关闭测试容器集群 `sudo ./stop.sh`