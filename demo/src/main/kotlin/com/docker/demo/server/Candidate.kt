package com.docker.demo.server

import org.apache.zookeeper.ZooKeeper

class Candidate : LoggerTool() {

    private lateinit var server: Server

    fun getId() = server.getId()

    fun isMaster() = server is Master

    fun isFollower(): Boolean = !isMaster()

    fun joinElection(zookeeper: ZooKeeper) {
        server = try {
            Master(zookeeper)
        } catch (e: Server.ServerCreateError) {
            Follower(zookeeper)
        }
    }
}