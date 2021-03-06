package com.cool1024.dubbo

import com.google.gson.Gson
import org.apache.dubbo.config.*
import java.util.concurrent.CountDownLatch


fun main(args: Array<String>) {
    if (args.isNotEmpty()) {
        println(Gson().toJson(args))
        runConsumer(args.first())
    } else {
        startProvider()
    }
}

fun startProvider() {
    val service: ServiceConfig<MyService> = ServiceConfig()
    service.setApplication(ApplicationConfig("first-dubbo-provider"))
    service.group = "dev"
    service.version = "1.0.0"
    service.provider.filter="tracing"
    service.setRegistry(RegistryConfig("zookeeper://zs1.example.com:2181"))
    service.metadataReportConfig = MetadataReportConfig("zookeeper://zs1.example.com:2181")
    service.setInterface(MyService::class.java)
    service.setRef(MyServiceImpl())
    service.export()

    println("dubbo service started")
    CountDownLatch(1).await()
}

fun runConsumer(name: String) {
    val reference: ReferenceConfig<MyService> = ReferenceConfig()
    reference.setApplication(ApplicationConfig("first-dubbo-consumer"))
    reference.group = "dev"
    reference.version = "1.0.0"
    reference.consumer.filter="tracing"
    reference.setRegistry(RegistryConfig("zookeeper://zs1.example.com:2181"))
    reference.setInterface(MyService::class.java)
    val service: MyService = reference.get()
    while (true) {
        val message: String = service.sayHello(name)
        println(message)
        Thread.sleep(1000)
    }
}