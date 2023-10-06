#!/bin/sh

# receive a <container_name> from arguments
# if <container_name> is not provided, return an error message
# if <container_name> is provided and found, run docker exec <container_name> ...
# if <container_name> is provided but not found, return an error message

if [ $# -eq 0 ]; then
    echo "No arguments provided. Please provide a <container_name>."
    exit 1
fi

if [ $# -eq 1 ]; then
    echo "One argument provided. Checking if <container_name> exists..."
    docker ps | grep $1
    if [ $? -eq 0 ]; then
        echo "Found <container_name> $1. Fixing sudo..."
        docker exec $1 bash -c "chown -R root:root /usr/bin/sudo /usr/lib/sudo/sudoers.so /etc/sudoers* \
            && chown -R tuser:tuser /home/tuser \
            && chmod 4755 /usr/bin/sudo"
        echo "Done."
    else
        echo "No <container_name> $1 found. Please provide a valid <container_name>."
        exit 1
    fi
fi
