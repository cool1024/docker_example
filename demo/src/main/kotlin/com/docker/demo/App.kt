package com.docker.demo

import com.docker.demo.prop.RunTimeProp
import org.apache.zookeeper.ZooKeeper

object App {

    @JvmStatic
    fun main(args: Array<String>) {
        println("App run...")
        RunTimeProp.getConfigObject(ZookeeperConfig::class.java)
    }

    private fun createZookeeperHandle() {
        // ZooKeeper(ZookeeperConfig.connectString)
    }
}