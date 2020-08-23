package com.docker.demo.zookeeper

import org.slf4j.LoggerFactory

open class LoggerTool {
    private val logger = LoggerFactory.getLogger(this::class.java)
    fun printInfo(format: String, vararg args: Any) = logger.info(format, args)
}