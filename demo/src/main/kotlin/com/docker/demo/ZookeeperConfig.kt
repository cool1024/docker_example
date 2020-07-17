package com.docker.demo

import com.docker.demo.prop.PropItem

data class ZookeeperConfig(
    @PropItem("connectString")
    val connectString: String
)