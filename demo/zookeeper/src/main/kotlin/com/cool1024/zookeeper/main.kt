package com.cool1024.zookeeper

fun main(args: Array<String>) {
    createZookeeperHandle().getChildren(
        "/", false, { _, path, _, children, _ ->
            children.forEach {
                println(path)
                println(it)
            }
        }, null
    )
    Thread.sleep(100000)
}