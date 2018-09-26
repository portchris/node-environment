#!/usr/bin/env bash

if [ -n "$1" ]; then
	sudo docker-compose -f docker-compose.$1.yml stop -t0
	sudo docker-compose -f docker-compose.$1.yml rm -f
	sudo docker-compose -f docker-compose.$1.yml up -d
else
	sudo docker-compose stop -t0
	sudo docker-compose rm -f
	sudo docker-compose up -d
fi
