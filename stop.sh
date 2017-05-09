#!/bin/bash

. docker-compose.env

CONTAINERS=`sudo docker ps -aq -f name=${DOCKER_PREFIX}*`
if [ -n "$CONTAINERS" ]; then
  sudo docker rm -f $CONTAINERS
fi
