#!/bin/bash

image_name="be_law_tools-img"

docker rmi -f "$image_name"

if [ -n "$JUPYTER_TOKEN" ]; then
    docker build --build-arg jupyter_token=$JUPYTER_TOKEN -t "$image_name" .
else
    echo "JUPYTER_TOKEN environment variable not set"
    exit 1
fi
