#!/usr/bin/env bash

source setenv.sh

echo "Criando imagem $DOCKER_REGISTRY/openjdk-$JAVA_VERSION"
docker build -t $DOCKER_REGISTRY/openjdk-$JAVA_VERSION .
