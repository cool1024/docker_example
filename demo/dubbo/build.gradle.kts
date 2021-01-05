import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    kotlin("jvm") version "1.4.20"
    application
}

group = "com.cool1024"
version = "1.0-SNAPSHOT"

dependencies {
    val dubbo_version = "2.7.8"
    implementation("org.apache.dubbo:dubbo:${dubbo_version}")
    implementation("org.apache.dubbo:dubbo-dependencies-zookeeper:${dubbo_version}")
    val brave_version = "5.9.5"
    implementation("io.zipkin.brave:brave-instrumentation-dubbo-rpc:${brave_version}")

    testImplementation(kotlin("test-junit"))
}

tasks.test {
    useJUnit()
}

tasks.withType<KotlinCompile>() {
    kotlinOptions.jvmTarget = "1.8"
}

application {
    mainClassName = "MainKt"
}