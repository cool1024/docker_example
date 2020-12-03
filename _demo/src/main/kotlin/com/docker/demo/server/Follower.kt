package com.docker.demo.server

import org.apache.zookeeper.CreateMode
import org.apache.zookeeper.ZooDefs
import org.apache.zookeeper.ZooKeeper

class Follower(zookeeper: ZooKeeper) : Server(zookeeper) {

    init {
        if (!create("$FOLLOWER_NODE_PATH/${getId()}")) {
            throw ServerCreateError()
        }
        printInfo("FOLLOWER CREATE SUCCESS,ID=[{}]", getId())
    }

    companion object {
        const val FOLLOWER_NODE_PATH = "/followers"
    }

}