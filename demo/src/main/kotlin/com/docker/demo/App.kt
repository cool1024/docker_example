package com.docker.demo

import com.docker.demo.config.ZookeeperConfig
import com.docker.demo.prop.RunTimeProp
import org.apache.zookeeper.ZooKeeper
import org.slf4j.LoggerFactory


object App {

    private val zookeeperConfig = RunTimeProp.config<ZookeeperConfig>()!!
    private val logger = LoggerFactory.getLogger(this::class.java)

    @JvmStatic
    fun main(args: Array<String>) {
        println("App run...")

        val zooKeeper = createZookeeperHandle()
        Thread.sleep(6000)
        zooKeeper.close()
    }

    private fun createZookeeperHandle(): ZooKeeper {
        return ZooKeeper(zookeeperConfig.connectString, zookeeperConfig.sessionTimeOut) { event ->
            logger.info("watcher event => [{}]", event)
        }
    }
}