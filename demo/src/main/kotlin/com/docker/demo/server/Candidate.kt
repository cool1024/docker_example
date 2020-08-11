package com.docker.demo.server

import org.slf4j.LoggerFactory


abstract class Candidate : LoggerTool() {

    private val logger = LoggerFactory.getLogger(this::class.java)

    private lateinit var server: Server

    abstract fun joinElection()

    fun getId() = server.getId()


    fun isMaster() = server is Master

    fun isFollower(): Boolean = !isMaster()
}