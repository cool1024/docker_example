package com.docker.demo.prop

@Target(AnnotationTarget.PROPERTY)
@Retention(AnnotationRetention.SOURCE)
@MustBeDocumented
annotation class PropFile(val fileName: String = "")