#!/usr/bin/env bash

IMAGENAME="ipunktbs/docker-revive-adserver"
CONTAINERNAME="revive"

docker stop $CONTAINERNAME && docker rm $CONTAINERNAME

docker build -t $IMAGENAME . \
    && docker run -d -it -p 8080:80 --name $CONTAINERNAME $IMAGENAME

docker logs $CONTAINERNAME
