#!/bin/bash
set -e

# データベースが起動するのを待機
bundle exec rails db:prepare

# サーバ起動
exec "$@"