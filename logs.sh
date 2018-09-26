#!/usr/bin/env bash

if [ -n "$1" ]; then
	sudo docker-compose -f docker-compose.$1.yml logs -f
else
	sudo docker-compose logs -f
fi
