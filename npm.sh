#!/usr/bin/env bash
source ./env/nodejs/.env

if [ ! -z $PROJECT ]; then
	sudo docker-compose exec nodejs npm $@ --prefix "/var/www/src/$PROJECT/src"
else
	echo "Please ensure you have set the PROJECT variable in ./env/nodejs/.env !!"
fi