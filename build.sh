#!/usr/bin/env bash

IS_OSX=false;
case "`uname`" in
  Darwin*) IS_OSX=true ;;
esac

mkdir -p ./data/nginx
mkdir -p ./data/postgres

# sudo docker pull launcher.gcr.io/google/debian8:latest
# sudo docker pull launcher.gcr.io/google/debian9:latest

if [ -n "$1" ]; then
	# docker-compose -f docker-compose.$1.yml pull
	if $IS_OSX; then
		sudo docker-compose -f docker-compose.$1.yml build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
	else
		sudo docker-compose -f docker-compose.$1.yml build --build-arg UID=$(id -u) 
	fi
else
	sudo docker-compose pull
	if $IS_OSX; then
		sudo docker-compose build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
	else
		sudo docker-compose build --build-arg UID=$(id -u)
	fi
fi
