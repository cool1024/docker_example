#!/bin/bash

source $(dirname $0)/util.sh

function prepare_env() {
    echo "net.core.somaxconn = 1024" >>/etc/profile
    echo 'vm.overcommit_memory = 1' >>/etc/profile
    echo '/sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
    sysctl -p
    source /etc/rc.local
}

# /var/redis/redis-server /var/redis/resource/sentinel.conf --sentinel
