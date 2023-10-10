#!/bin/sh -e

#Print some Debug
set -x

###################################################
# We'll need binaries from different paths,       #
#  so we should be sure, all bin dir in the PATH  #
###################################################
PATH="${PATH}:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

#################################
# Create temp working directory #
#################################
WORK_DIR="/tmp/build"
mkdir -p $WORK_DIR
cd $WORK_DIR

################################
# Install some needed packages #
################################
apk update
apk add poppler-utils inotify-tools

#########################################
# Delete all unneded files and packages #
#########################################
cd /
rm /var/cache/apk/*
rm -rf /root/.cache

echo "Done!"