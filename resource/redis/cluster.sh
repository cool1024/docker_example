#!/bin/bash

function get_ip() { 
    ping -c 2 $1 | head -2 | tail -1 | awk '{print $5}' | sed 's/[(:)]//g'
}

server1_ip=`get_ip redis1.example.com`
server2_ip=`get_ip redis2.example.com`
server3_ip=`get_ip redis3.example.com`
server4_ip=`get_ip redis4.example.com`
server5_ip=`get_ip redis5.example.com`
server6_ip=`get_ip redis6.example.com`

/var/redis/redis-cli --cluster create \
    $server1_ip:7001 \
    $server2_ip:7002 \
    $server3_ip:7003 \
    $server4_ip:7004 \
    $server5_ip:7005 \
    $server6_ip:7006 \
    --cluster-replicas 1