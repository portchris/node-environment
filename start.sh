#!/usr/bin/env bash

if [ -n "$1" ]; then
	sudo docker-compose -f docker-compose.$1.yml up -d --remove-orphans
else
	sudo docker-compose up -d --remove-orphans
fi
