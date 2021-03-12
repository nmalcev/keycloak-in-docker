#!/usr/bin/env bash
DC_PATH=./misc/docker-compose.yml
ENV_PATH=./misc/dev.env
ENV_PATH="$(cd "$(dirname "$ENV_PATH")"; pwd)/$(basename "$ENV_PATH")"
cp $ENV_PATH .env


docker-compose -f $DC_PATH down
docker-compose -f $DC_PATH --env-file=$ENV_PATH up --build -d 


sleep 5s
docker-compose -f $DC_PATH --env-file=$ENV_PATH ps && docker-compose -f $DC_PATH --env-file=$ENV_PATH logs
