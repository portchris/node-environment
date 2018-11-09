#!/usr/bin/env bash

if [ -n "$1" ]; then
	sudo docker-compose -f docker-compose.yml logs --follow --timestamps $1
else
	sudo docker-compose logs --follow --timestamps
fi
