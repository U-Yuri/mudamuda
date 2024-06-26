# アプリケーション名
muda0(むだゼロ)<br>
![スクリーンショット 2024-06-24 14 23 40](https://github.com/U-Yuri/mudamuda/assets/80314978/82775b10-5b6b-47de-8d3b-372545b267df)
## URL
https://mudazero.uezono.studio/
## アプリケーション概要
お金の無駄使いを減らし、ミニマリストを目指すアプリ。
物欲を減らす理論に基づき作成し、１ヶ月後に見返し本当に必要であれば購入、１ヶ月後に見返し欲しくないものであれば削除する、という趣旨のアプリ。
## ER図
![スクリーンショット 2024-06-25 15 10 44](https://github.com/U-Yuri/mudamuda/assets/80314978/dc3cc0c6-43cb-4843-9fc9-826de1ef929b)

## 画面遷移図
![スクリーンショット 2024-06-24 15 02 23](https://github.com/U-Yuri/mudamuda/assets/80314978/93b3c887-a394-4965-9269-17b718f8a664)
## 使用方法
1. 新規登録しマイページにログイン。
2. 欲しいものを登録する（画像、商品名、金額）。
3. １ヶ月後にもう一度見直し購入するか、削除するか判断する。
## 使用技術
- ruby
- rails
- html css
- sqlite3
- さくらvps
- nginx
- letsencrypt(無料SSL証明書)
- puma
## 機能一覧
- ユーザ登録・ログイン機能（devise）
- 画像投稿機能（Active　Storage）
## 使用Gem
- devise-i18n(deviseの多言語化)
- rails-i18n
## デプロイ（アップデート）に必要な操作
- 以下のコードで本番環境に切り替えてからサーバを立ち上げる
  ```bash
  $ export RAILS_ENV=production
  ```
- 画像を変更および更新した際コンパイルする必要あり
  （本番環境と開発環境ではパスが異なるため）
  ```bash
  $ rails assets:precompile
  ```
- DBを新たに設計したらマイグレートする
  ```bash
  $ rails db:migrate
  ```
- 更新したら以下のコードでサーバリスタートし確認
  ```bash
  $ sudo systemctl restart mudazero.service
  ```


