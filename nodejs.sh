#!/usr/bin/env bash

sudo docker-compose exec nodejs bash -c 'cd /var/www/src; exec "${SHELL:-sh}"'