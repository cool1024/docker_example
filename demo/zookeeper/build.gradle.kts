import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    kotlin("jvm") version "1.4.20"
    application
}

group = "com.cool1024"
version = "1.0-SNAPSHOT"

dependencies {
    val zookeeper_version = "3.4.5"
    implementation("org.apache.zookeeper:zookeeper:$zookeeper_version")
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