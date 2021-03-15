#!/usr/bin/env bash
DC_PATH=./misc/docker-compose.yml
ENV_PATH=./misc/dev.env
ENV_PATH="$(cd "$(dirname "$ENV_PATH")"; pwd)/$(basename "$ENV_PATH")"
cp $ENV_PATH .env

sh -c "docker-compose -f $DC_PATH --env-file=$ENV_PATH down --remove-orphans"
sh -c "docker-compose -f $DC_PATH --env-file=$ENV_PATH --verbose up --build -d"

sleep 5s
docker-compose -f $DC_PATH --env-file=$ENV_PATH ps && docker-compose -f $DC_PATH --env-file=$ENV_PATH logs
