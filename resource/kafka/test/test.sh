#!/bin/bash

source /etc/profile

/var/kafka/bin/kafka-topics.sh --create --zookeeper zs1.example.com:2181 --replication-factor 2 --partitions 1 --topic testTopic

/var/kafka/bin/kafka-console-producer.sh --broker-list kfk1.example.com:9092 --topic testTopic

/var/kafka/bin/kafka-console-consumer.sh --zookeeper zs1.example.com:2181 --topic testTopic --from-beginning
