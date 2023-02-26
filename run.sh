#!/bin/bash

# https://docs.docker.jp/v19.03/config/container/multi-service_container.html
# ジョブコントロールを有効にする
set -xm

crontab $CRONTAB_FILE
cat $CRONTAB_FILE
echo "crontab installed"

# cupsサーバの開始
/usr/sbin/cupsd -f &

# 少し待つ
sleep 10
lpadmin -p printer -E -v $PRINTER_URI -m everywhere

cron -f
