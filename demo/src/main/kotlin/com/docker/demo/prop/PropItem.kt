package com.docker.demo.prop

@Target(AnnotationTarget.PROPERTY)
@Retention(AnnotationRetention.SOURCE)
@MustBeDocumented
annotation class PropItem(val keyName: String = "", val fileName: String = "")