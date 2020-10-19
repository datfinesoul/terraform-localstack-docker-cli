#!/usr/bin/env bash
export TF_UID="$(id -u)"
export TF_GID="$(id -u)"
docker-compose \
  -f docker-compose.terraform.yml \
  -p terraform \
  run \
  terraform "$@"
