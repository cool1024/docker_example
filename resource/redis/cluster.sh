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
    $server1_ip:7000 \
    $server2_ip:7000 \
    $server3_ip:7000 \
    $server4_ip:7000 \
    $server5_ip:7000 \
    $server6_ip:7000 \
    --cluster-replicas 1