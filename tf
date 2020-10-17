#!/usr/bin/env bash
docker-compose -f docker-compose.terraform.yml -p terraform run terraform "$@"
