package com.docker.demo.server

import org.apache.zookeeper.ZooKeeper
import org.slf4j.LoggerFactory

abstract class Server(protected val zookeeper: ZooKeeper) {

    private val logger = LoggerFactory.getLogger(this::class.java)

    /**
     * The function for create server
     */
    abstract fun init(): Server

    fun debug(format: String, vararg args: Any) = logger.info(format, args)

    fun close() = zookeeper.close()
}