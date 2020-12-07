#!/bin/bash
echo 'export JAVA_HOME=/var/kafka/jdk' >> /etc/profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
source /etc/profile

# /var/kafka/bin/kafka-server-start.sh -daemon /var/kafka/config/server.properties
# /var/kafka/bin/kafka-server-stop.sh
/var/kafka/bin/kafka-server-start.sh /var/kafka/config/server.properties