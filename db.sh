#!/usr/bin/env bash

sudo docker-compose exec --user www-data postgres postgres -upostgres -ppassword $@