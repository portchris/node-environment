#!/usr/bin/env bash

if [ -n "$1" ]; then
	sudo docker-compose -f docker-compose.yml logs -f $1
else
	sudo docker-compose logs -f
fi
