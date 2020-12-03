# Zookeeper Docker Example

## Language

* [简体中文](README.MD) 
* [English](README_EN.MD)

## Dubbo Test

### Prepare
1. **Java runtime environment**<br>
Put Java SDK(for linux) directory into project root path, rename to jdk.

2. **Zookeeper Lib**<br><br>
Put all file which zookeeper need into `zookeeper/lib`.

3. **Docker environment(need docker-compose)**

4. **Permission**
```bash
chmod +x *.sh
chmod +x bin/*.sh
chmod +x zookeeper/bin/*.sh
```

5. **Package demo**<br>
You need package demo/dubbo, and put demo.dubbo.main.jar into demo/out/artifacts/demo_dubbo_main_jar

### Run Example

1. start `./dubbo.sh`
2. stop `./stop.sh`