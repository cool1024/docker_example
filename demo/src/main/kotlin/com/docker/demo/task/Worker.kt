package com.docker.demo.task

import com.docker.demo.server.LoggerTool
import org.apache.zookeeper.ZooKeeper
import org.apache.zookeeper.data.Stat

class Worker(private val zookeeper: ZooKeeper, private val taskId: String) : LoggerTool() {

    private var workData: String

    init {
        val bytes = zookeeper.getData(Task.ZOOKEEPER_TASK_PATH, false, Stat())
        workData = String(bytes)
        printInfo("WORK INIT SUCCESS, ID=[{}]", taskId)
    }

    fun run() {
        printInfo("DO WORK,ID=[{}],DATA=[{}]", taskId, workData)
        complete()
    }

    private fun complete() {
        zookeeper.delete(taskId, -1)
    }
}