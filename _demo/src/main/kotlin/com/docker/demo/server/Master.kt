package com.docker.demo.server

import org.apache.zookeeper.ZooKeeper

class Master(zookeeper: ZooKeeper) : Server(zookeeper) {

    init {
        if (!create(MASTER_NODE_PATH)) {
            throw ServerCreateError()
        }
        printInfo("MASTER CREATE SUCCESS,ID=[{}]", getId())
    }

    companion object {
        const val MASTER_NODE_PATH = "/master"
    }
}