#!/bin/sh

set -e

# 利用するイメージ作成
if !( docker images | fgrep -q tom/docker-gae-go ); then
  docker build -t tom/docker-gae-go .
fi

# 起動
docker-compose up -d
