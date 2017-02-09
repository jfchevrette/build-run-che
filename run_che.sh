#!/bin/bash

# if it builds, lets run it locally

DataDir=~/.che/
mkdir -p ${DataDir}/lib
mkdir -p ${DataDir}/workspaces
mkdir -p ${DataDir}/storage

docker run -d -p 8080:8080 --name che -e CHE_DOCKER_SERVER__EVALUATION__STRATEGY=docker-local -v /var/run/docker.sock:/var/run/docker.sock -v ~/.che:/data:Z --security-opt label:disable rhche/che-server:nightly

echo "Che is available at:"
echo "http://$(docker port che 8080/tcp)"
echo "http://$(docker inspect -f '{{.NetworkSettings.IPAddress}}:8080' che)"
