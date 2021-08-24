#!/bin/bash

docker-compose \
        -f ./docker/search.yaml \
        down

docker-compose \
        -f ./docker/search.yaml \
        up -d

docker exec -it search.example.com /bin/bash