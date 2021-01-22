# Dubbo Example

## 准备工作

### JAVA运行环境
将JAVA SDK(Linux版本)文件夹放在项目根目录下，并重命名该文件夹为jdk

### Zookeeper依赖库
将Zookeeper所需的所有jar包文件放在项目的`resource/zookeeper/lib`目录中

### Docker环境(需要docker-compose工具)
安装docker与docker-compose

### 授予脚本运行权限
```bash
chmod +x *.sh
chmod +x bin/*.sh
chmod +x resource/zookeeper/bin/*.sh
```
### 打包demo
1. 使用IntellJ IDEA导入demo目录作为gradle项目
2. 配置项目打包成jar包
3. 打包项目，你需要把demo/dubbo项目打包到demo/out/artifacts/demo_dubbo_main_jar目录下，并命名为demo.dubbo.main.jar

## 运行/关闭项目

```bash
# Start example
start `./dubbo.sh`

# Stop example
top `./stop.sh`
```
