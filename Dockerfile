# https://github.com/commojun/cron
FROM commojun/cron:latest

# cups をインストール
RUN apt-get update && \
    apt-get install -y cups && \
    apt-get clean

# run.sh は専用のもので置き換える
COPY ./run.sh /run.sh
# 専用イメージなのでこれらも埋め込む
COPY ./crontab /crontab
COPY ./test-print.pdf /test-print.pdf
