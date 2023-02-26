# print-test

インクジェットプリンタを長期間放置すると起きてしまうインクの目詰まりを防ぐため、自動的にテストページを印刷するサービス

## 利用するもの

- Dockerで定期実行ジョブを実行するためのcronイメージ([commojun/cron](https://github.com/commojun/cron))
- CUPS

## 必要な前準備

- 利用したいプリンターがネットワークに接続していること
- プリンターのIPアドレスが固定されているか特定のホスト名でアクセスできるようになっていること

## 設定

`.env` ファイルを作成して `$PRINTER_URI` 環境変数を設定する。プリンターのIPアドレス宛にブラウザでアクセスするなりして管理画面を開くとどこかにURLが記載されているはず。 `.env.sample` にはIPPプロトコルのサンプルっぽいURLを記載した。

ビルド
```
$ make build
(docker compose build)
```

起動
```
$ make up
(docker compose up -d)
```

## run.sh

コンテナのエントリポイントとなっているシェルスクリプト。crondとcupsdの2つのプロセスを実行している。

cupsdサービスを起動後、このコマンドで、使いたいプリンタを追加している。プリンタ名は `printer` とした。
```
lpadmin -p printer -E -v $PRINTER_URI -m everywhere
```

## crontab

`run.sh` で読み込まれる定期実行ジョブの定義

lpコマンドを利用してプリントを実行する。オプション `-o fitplot` を設定することで、プリンターに現在セットされている用紙サイズに合わせてPDFを印刷するようにした。
```
lp -d printer -o fitplot /test-print.pdf
```
