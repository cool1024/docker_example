package com.docker.demo.zookeeper

import jdk.jshell.execution.Util
import org.apache.zookeeper.WatchedEvent
import org.apache.zookeeper.ZooKeeper
import org.slf4j.LoggerFactory

private val logger = LoggerFactory.getLogger("ZookeeperUtil")
fun printInfo(format: String, vararg args: Any) = logger.info(format, args)

fun createZookeeperHandle(handleFun: ((event: WatchedEvent) -> Util)? = null): ZooKeeper {
    val config = ZookeeperConfig.instance
    return ZooKeeper(config.connectString, config.sessionTimeOut) { event ->
        printInfo("WATCH EVENT => [{}]", event.toString())
        handleFun?.invoke(event)
    }
}
