package com.cool1024.zookeeper.prop

@Target(AnnotationTarget.CLASS)
@Retention(AnnotationRetention.RUNTIME)
@MustBeDocumented
annotation class PropFile(val fileName: String)