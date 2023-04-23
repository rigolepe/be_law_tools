#!/bin/bash

image_name="be_law_tools-img"
container_name="be_law_tools"
WORK=$(pwd)

docker rm "$container_name" 
docker create -it --name "$container_name" -v "$WORK":/work -p 8888:8888 "$image_name" 

