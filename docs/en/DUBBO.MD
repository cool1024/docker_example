# Dubbo Example

## Prepare

### Java runtime environment
Put Java SDK(for linux) directory into project root path, rename to jdk.

### Zookeeper Lib
Put all file which zookeeper need into `resource/zookeeper/lib`.

### Docker environment(need docker-compose)
Install docker and docker-compose

### Shell Permission
```bash
chmod +x *.sh
chmod +x bin/*.sh
chmod +x resource/zookeeper/bin/*.sh
```
### Package demo
You need package demo/dubbo, and put demo.dubbo.main.jar into demo/out/artifacts/demo_dubbo_main_jar

## Run Example

```bash
# Start example
start `./dubbo.sh`

# Stop example
top `./stop.sh`
```