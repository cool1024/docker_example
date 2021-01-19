#!/bin/bash

function get_ip() { 
    ping -c 2 $1 | head -2 | tail -1 | awk '{print $5}' | sed 's/[(:)]//g'
}

function prepare_env() {
    echo "net.core.somaxconn = 1024" >> /etc/sysctl.conf
    echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
    # echo '/sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
    # source /etc/rc.local
    sysctl -p
    echo never > /sys/kernel/mm/transparent_hugepage/enabled
}