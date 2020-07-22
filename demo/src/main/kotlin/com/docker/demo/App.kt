package com.docker.demo

import com.docker.demo.config.ZookeeperConfig
import com.docker.demo.prop.RunTimeProp
import org.apache.zookeeper.ZooKeeper

object App {

    private val zookeeperConfig = RunTimeProp.config<ZookeeperConfig>()!!

    @JvmStatic
    fun main(args: Array<String>) {
        println("App run...")

        createZookeeperHandle()
    }

    private fun createZookeeperHandle() {
        ZooKeeper(zookeeperConfig.connectString, zookeeperConfig.sessionTimeOut) { event ->
            print(event)
        }
    }
}