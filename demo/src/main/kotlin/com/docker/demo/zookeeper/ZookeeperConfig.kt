package com.docker.demo.zookeeper

import com.docker.demo.prop.PropFile
import com.docker.demo.prop.PropItem
import com.docker.demo.prop.RunTimeProp

@PropFile(fileName = "zookeeper-config")
data class ZookeeperConfig(
    @PropItem(keyName = "connectString")
    var connectString: String,
    @PropItem(keyName = "sessionTimeOut")
    var sessionTimeOut: Int
) {
    companion object {
        val instance = RunTimeProp.config<ZookeeperConfig>()!!
    }
}