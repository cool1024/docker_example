package com.docker.demo.task

import com.docker.demo.zookeeper.createZookeeperHandle

class TaskManager {

    private val tasks = arrayListOf<Task>()

    fun addTask(workData: String) {
        tasks.add(Task(createZookeeperHandle(), workData))
    }

    fun start() {
        createZookeeperHandle().getChildren(
            Task.TASK_PATH, true, { _, path, _, children, _ -> children.forEach { doWork(path, it) } }, null
        )
    }

    fun doWork(path: String, childName: String) {

    }
}
