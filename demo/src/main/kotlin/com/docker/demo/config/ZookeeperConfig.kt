package com.docker.demo.config

import com.docker.demo.prop.PropFile
import com.docker.demo.prop.PropItem

@PropFile(fileName = "zookeeper-config")
data class ZookeeperConfig(
    @PropItem(keyName = "connectString")
    var connectString: String,
    @PropItem(keyName = "sessionTimeOut")
    var sessionTimeOut: Int
)