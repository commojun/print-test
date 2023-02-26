#!/bin/bash

crontab $CRONTAB_FILE
cat $CRONTAB_FILE
echo "crontab installed"

# プリンタの追加
lpadmin -p printer -E -v $PRINTER_URI -m everywhere

cron -f
