package com.cool1024.dubbo

class MyServiceImpl : MyService {
    override fun sayHello(name: String): String {
        return "Hello world => ${name}!"
    }
}