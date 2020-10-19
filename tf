#!/usr/bin/env bash
TF_UID="$(id -u)"
TF_GID="$(id -g)"
export TF_UID TF_GID
docker-compose \
  -f docker-compose.terraform.yml \
  -p terraform \
  run \
  terraform "$@"
