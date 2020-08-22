package com.docker.demo.task

import com.docker.demo.server.LoggerTool
import org.apache.zookeeper.CreateMode
import org.apache.zookeeper.ZooDefs
import org.apache.zookeeper.ZooKeeper

class Task(zookeeper: ZooKeeper, workData: String) : LoggerTool() {

    init {
        val taskId = zookeeper.create(
            ZOOKEEPER_TASK_PATH,
            workData.toByteArray(),
            ZooDefs.Ids.OPEN_ACL_UNSAFE,
            CreateMode.PERSISTENT_SEQUENTIAL
        )
        printInfo("TASK INIT SUCCESS, ID=[{}]", taskId)
    }

    companion object {
        const val ZOOKEEPER_TASK_PATH = "/tasks/task-"
    }
}