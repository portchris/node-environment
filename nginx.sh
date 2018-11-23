#!/usr/bin/env bash

sudo docker-compose exec nginx sh -c 'cd /etc/nginx; exec "${SHELL:-sh}"'