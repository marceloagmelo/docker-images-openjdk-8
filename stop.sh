#!/usr/bin/env bash

source setenv.sh

echo "Finalizando o $CONTAINER_NAME..."
docker rm -f $CONTAINER_NAME
