package com.docker.demo

import com.docker.demo.prop.PropFile
import com.docker.demo.prop.PropItem

@PropFile(fileName = "zookeeper-config")
class ZookeeperConfig() {

    @PropItem(keyName = "connectString")
    var connectString: String = String()

    @PropItem(keyName = "sessionTimeOut")
    var sessionTimeOut: Long = 0
}