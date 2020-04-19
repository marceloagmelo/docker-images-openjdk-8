#!/usr/bin/env bash

source setenv.sh

echo "Subindo $CONTAINER_NAME..."
docker run -d --name $CONTAINER_NAME \
-p 8080:8080 \
-e TZ=America/Sao_Paulo \
$DOCKER_REGISTRY/openjdk-$JAVA_VERSION

# Listando os containers
docker ps


#docker run -it --name $CONTAINER_NAME \
#-p 8080:8080 \
#-e TZ=America/Sao_Paulo \
#$DOCKER_REGISTRY/openjdk-$JAVA_VERSION shell