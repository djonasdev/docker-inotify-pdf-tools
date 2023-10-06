#!/bin/sh
#Run a docker container with host folder as a volume

#Default volume path on host.
VOLUME_PATH="/mnt/d/Repositories/github.com/docker-inotify-pdf-tools/"
#Container hostname
CONTAINER_HOSTNAME="pdf-tools.domain.com"
#Container name
CONTAINER_NAME="pdf-tools"
#Restart policy
RESTART_POLICY="unless-stopped"
#Some extra arguments. Like -d ant -ti
EXTRA_ARGS="-d"
#docker command. You can use "sudo docker" if you need so
DOCKER="docker"
#Extra args to docker command. Like using remote dockerd or something else
DOCKER_ARGS=""

#Image name
IMAGE="djonasdev/docker-inotify-pdf-tools"

#Stop the old instance if already running
./docker-stop.sh

[ ! -z "$CONTAINER_HOSTNAME" ] && CONTAINER_HOSTNAME="--hostname=$CONTAINER_HOSTNAME"
[ ! -z "$CONTAINER_NAME" ]     && CONTAINER_NAME="--name=$CONTAINER_NAME"
[ ! -z "$RESTART_POLICY" ]      && RESTART_POLICY="--restart=$RESTART_POLICY"

$DOCKER $DOCKER_ARGS run \
	-v $VOLUME_PATH/input:/input \
	-v $VOLUME_PATH/output:/output \
	$CONTAINER_HOSTNAME \
	$CONTAINER_NAME \
	$RESTART_POLICY \
	$EXTRA_ARGS \
	$IMAGE
