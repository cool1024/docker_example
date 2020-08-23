package com.docker.demo.server

import com.docker.demo.zookeeper.LoggerTool
import com.docker.demo.zookeeper.ZookeeperConfig
import com.docker.demo.zookeeper.createZookeeperHandle
import org.apache.zookeeper.CreateMode
import org.apache.zookeeper.KeeperException
import org.apache.zookeeper.ZooDefs
import org.apache.zookeeper.ZooKeeper
import java.util.concurrent.Executors

class MasterSelector : LoggerTool() {

    private val candidates = arrayListOf<Candidate>()

    init {
        try {
            createZookeeperHandle().create(
                Follower.FOLLOWER_NODE_PATH,
                null,
                ZooDefs.Ids.OPEN_ACL_UNSAFE,
                CreateMode.PERSISTENT
            )
        } catch (e: KeeperException.NodeExistsException) {
            printInfo("FOLLOWERS NODE CREATED")
        }
    }

    fun addCandidate(candidate: Candidate) {
        candidates.add(candidate)
    }

    fun start() {
        val pool = Executors.newFixedThreadPool(candidates.size)
        candidates.forEach { candidate ->
            pool.execute { candidate.joinElection(createZookeeperHandle()) }
        }
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