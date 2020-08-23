package com.docker.demo.server

import com.docker.demo.zookeeper.LoggerTool
import org.apache.zookeeper.CreateMode
import org.apache.zookeeper.KeeperException
import org.apache.zookeeper.ZooDefs
import org.apache.zookeeper.ZooKeeper
import java.lang.RuntimeException
import kotlin.math.abs
import kotlin.random.Random

open class Server(private val zookeeper: ZooKeeper) : LoggerTool() {

    private val serverId: String = generateServerId()
    fun create(path: String, maxTryNumber: Int = 10): Boolean {
        return if (maxTryNumber == 0) false
        else {
            try {
                printInfo(">>>>>>${path}<<<<<")
                zookeeper.create(
                    path,
                    serverId.toByteArray(),
                    ZooDefs.Ids.OPEN_ACL_UNSAFE,
                    CreateMode.EPHEMERAL
                )
                printInfo("SERVER CREATE SUCCESS,ID=[{}]", serverId)
                true
            } catch (e: InterruptedException) {
                printInfo("SERVER INTERRUPTED,ERROR=[{}]", e.toString())
                return create(path, maxTryNumber.dec())
            } catch (e: KeeperException.NodeExistsException) {
                printInfo("SERVER CREATE ERROR,ERROR=[{}]", e.toString())
                false
            }
        }

    }

    fun close() = zookeeper.close()

    fun getId() = serverId

    class ServerCreateError : RuntimeException()

    companion object {
        fun generateServerId(): String {
            val randomInt = Random(System.nanoTime()).nextInt()
            return abs(randomInt).toString()
        }
    }
}