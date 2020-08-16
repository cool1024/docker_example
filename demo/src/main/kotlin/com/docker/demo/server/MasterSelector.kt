package com.docker.demo.server

import com.docker.demo.App
import com.docker.demo.config.ZookeeperConfig
import com.docker.demo.prop.RunTimeProp
import org.apache.zookeeper.ZooKeeper

class MasterSelector : LoggerTool() {

    private val candidates = arrayListOf<Candidate>()
    private val zookeeperConfig = RunTimeProp.config<ZookeeperConfig>()!!

    private fun createZookeeperHandle(): ZooKeeper {
        return ZooKeeper(zookeeperConfig.connectString, zookeeperConfig.sessionTimeOut) { event ->
            printInfo("watcher event => [{}]", event)
        }
    }

    fun addCandidate(candidate: Candidate) {
        candidates.add(candidate)
    }

    fun start() {
        candidates.forEach { candidate -> candidate.joinElection(createZookeeperHandle()) }
    }

    fun printResult() {
        val master = candidates.find { candidate -> candidate.isMaster() }
        val followers = candidates.filter { it.isFollower() }.map { it.getId() }
        print(
            """
            MasterId: ${master?.getId()}
            Follows: ${followers.joinToString { it }}
            """.trimIndent()
        )
    }
}