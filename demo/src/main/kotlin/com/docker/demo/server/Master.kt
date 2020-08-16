package com.docker.demo.server

import org.apache.zookeeper.ZooDefs
import org.apache.zookeeper.CreateMode
import org.apache.zookeeper.ZooKeeper
import org.apache.zookeeper.KeeperException
import org.apache.zookeeper.data.Stat
import java.lang.Exception
import kotlin.properties.Delegates
import kotlin.random.Random

class Master(zookeeper: ZooKeeper) : Server(zookeeper) {

    init {
        if (!create(MASTER_NODE_PATH)) {
            throw ServerCreateError()
        }
    }


//    private fun becomeMaster(zookeeper: ZooKeeper, masterId: String) {
//        try {
//            zookeeper.create(
//                MASTER_NODE_PATH,
//                masterId.toByteArray(),
//                ZooDefs.Ids.OPEN_ACL_UNSAFE,
//                CreateMode.EPHEMERAL
//            )
//            printInfo("MASTER CREATE SUCCESS,ID=[{}]", masterId)
//        } catch (e: InterruptedException) {
//            e.printStackTrace()
//            printInfo("SERVER INTERRUPTED,ERROR=[{}]", e)
//            checkMaster(zookeeper, masterId)
//        } catch (e: KeeperException) {
//            e.printStackTrace()
//            printInfo("SERVER CONNECTION LOST,ERROR=[{}]", e)
//            checkMaster(zookeeper, masterId)
//        }
//    }
//
//    private fun becomeSuccessCallback() {
//        isMaster = true
//        printInfo("ID=[{}] BECOME MASTER", masterId)
//    }
//
//    private fun checkMaster(zookeeper: ZooKeeper, masterId: String) {
//        try {
//            val data = zookeeper.getData(MASTER_NODE_PATH, false, Stat())
//            val exMasterId = String(data)
//            if (masterId.equals(exMasterId)) {
//                becomeSuccessCallback()
//            } else {
//                printInfo("MASTER EXIST, MASTER ID=[{}], SELF ID=[{}]", exMasterId, masterId)
//            }
//        } catch (e: Exception) {
//            becomeMaster(zookeeper, masterId)
//        }
//    }

    companion object {
        const val MASTER_NODE_PATH = "/master"
    }

}