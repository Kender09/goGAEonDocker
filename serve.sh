#!/bin/sh

set -e

# 利用するイメージ作成
if !( docker images | fgrep -q tom/docker-gae-go ); then
  docker build -t tom/docker-gae-go .
fi

# ライブラリ保管用コンテナ
if !( docker ps | fgrep -q go_src ); then
  docker run -itd --name go_src -v /go busybox
fi

# 依存ライブラリをダウンロード
docker run --rm --volumes-from go_src -v  $PWD/app:/go/src/app -v $PWD/src/app:/go/src/app golang:1.6-onbuild go-wrapper download

# 起動
docker-compose up -d
