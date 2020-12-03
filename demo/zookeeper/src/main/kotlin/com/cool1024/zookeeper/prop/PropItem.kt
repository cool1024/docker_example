package com.cool1024.zookeeper.prop

@Target(AnnotationTarget.FIELD)
@Retention(AnnotationRetention.RUNTIME)
@MustBeDocumented
annotation class PropItem(val keyName: String)