#!/bin/bash

for container in $(docker ps -q); do

    CONTAINER_NAME=$(docker inspect -f '{{.Name}}' "$container" | sed 's/\///')

    echo "----------------------- $CONTAINER_NAME ------------------------------------------"

    echo "Container ID: $container"
    echo "Container IP: $(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$container")"
    echo "Container Name: "
    echo "Container Status: $(docker inspect -f '{{.State.Status}}' "$container")"
    echo "Container Image: $(docker inspect -f '{{.Config.Image}}' "$container")"
    echo "Container Ports: $(docker inspect -f '{{range .NetworkSettings.Ports}}{{.}}{{end}}' "$container")"
    echo "Container Port Mappings: $(docker port "$container")"
    echo "========================================================================================="

done