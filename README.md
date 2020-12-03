# Zookeeper Docker Example

* [简体中文](README.MD) 
* [English](README_EN.MD)

## 运行前准备

1. Java环境复制<br><br>
将JAVA SDK(Linux版本)文件夹放在项目根目录下，并重命名该文件夹为jdk

2. Zookeeper库文件复制<br><br>
将Zookeeper所需的所有jar包文件放在项目的zookeeper/lib目录中

3. Docker运行环境(需要docker-compose工具)

4. 给相关脚本可执行权限
```bash
chmod +x *.sh
chmod +x bin/*.sh
chmod +x zookeeper/bin/*.sh
```

## 运行测试

1. 启动测试容器集群 `sudo ./reset.sh`
2. 关闭测试容器集群 `sudo ./stop.sh`

## Zookeeper Api Demo

### 打包DEMO项目

1. 使用IntellJ IDEA导入demo目录作为gradle项目
2. 配置项目打包成jar包
3. 打包项目

### 运行容器

1. 启动测试容器集群 `sudo ./demo.sh`
2. 关闭测试容器集群 `sudo ./stop.sh`
