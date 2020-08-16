package com.docker.demo.server

import org.apache.zookeeper.ZooKeeper

class Follower(zookeeper: ZooKeeper) : Server(zookeeper) {

    init {
        if (!create("$FOLLOWER_NODE_PATH/${getId()}")) {
            throw ServerCreateError()
        }
    }

    companion object {
        const val FOLLOWER_NODE_PATH = "/followers"
    }

}