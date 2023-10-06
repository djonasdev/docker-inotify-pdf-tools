#!/bin/sh
#Open bash shell in the container

#docker command. You can use "sudo docker" if you need so
DOCKER="docker"
#Image name
IMAGE="djonasdev/docker-inotify-pdf-tools"

$DOCKER exec -it $($DOCKER ps -a -q --filter ancestor=$IMAGE --format="{{.ID}}") /bin/sh