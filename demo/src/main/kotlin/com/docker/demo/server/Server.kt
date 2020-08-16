package com.docker.demo.server

import org.apache.zookeeper.CreateMode
import org.apache.zookeeper.KeeperException
import org.apache.zookeeper.ZooDefs
import org.apache.zookeeper.ZooKeeper
import java.lang.RuntimeException
import kotlin.random.Random

open class Server(protected val zookeeper: ZooKeeper) : LoggerTool() {

    private val serverId: String = Random(System.currentTimeMillis()).nextInt().toString()

    fun create(path: String, maxTryNumber: Int = 10): Boolean {
        return if (maxTryNumber == 0) false
        else {
            try {
                zookeeper.create(
                    path,
                    serverId.toByteArray(),
                    ZooDefs.Ids.OPEN_ACL_UNSAFE,
                    CreateMode.EPHEMERAL
                )
                printInfo("SERVER CREATE SUCCESS , ID=[{}]", serverId)
                true

            } catch (e: InterruptedException) {
                printInfo("SERVER INTERRUPTED , ERROR=[{}]", e.toString())
                return create(path, maxTryNumber.dec())
            } catch (e: KeeperException.NodeExistsException) {
                printInfo("SERVER CREATE ERROR , ERROR=[{}]", e.toString())
                false
            }
        }

    }

    fun close() = zookeeper.close()

    fun getId() = serverId

    class ServerCreateError : RuntimeException()
}