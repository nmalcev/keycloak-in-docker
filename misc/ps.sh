#!/usr/bin/env bash
DC_PATH=./misc/docker-compose.yml
ENV_PATH=./misc/dev.env
docker-compose -f $DC_PATH --env-file=$ENV_PATH ps 
# docker-compose -f $DC_PATH --env-file=$ENV_PATH logs

