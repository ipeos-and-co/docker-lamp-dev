#!/bin/bash

. docker-compose.env

./stop.sh

envsubst < docker-compose.tpl > docker-compose.yml && \
sudo docker-compose up --build -d
