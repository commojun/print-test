# https://github.com/commojun/cron
FROM commojun/cron:latest

# cups をインストール
RUN apt-get update && \
    apt-get install cups && \
    apt-get clean

# run.sh は専用のもので置き換える
COPY ./run.sh /run.sh
# 専用イメージなのでこれらも埋め込む
COPY ./crontab /crontab
COPY ./print.sh /print.sh

