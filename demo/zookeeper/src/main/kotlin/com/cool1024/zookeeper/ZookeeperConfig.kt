package com.cool1024.zookeeper

import com.cool1024.zookeeper.prop.PropFile
import com.cool1024.zookeeper.prop.PropItem
import com.cool1024.zookeeper.prop.RunTimeProp

@PropFile(fileName = "zookeeper-config")
data class ZookeeperConfig(
    @PropItem(keyName = "connectString")
    var connectString: String,
    @PropItem(keyName = "sessionTimeOut")
    var sessionTimeOut: Int
) {
    companion object {
        val instance = RunTimeProp.config<ZookeeperConfig>()
    }
}