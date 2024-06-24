# アプリケーション名
muda0(むだゼロ)<br>
![スクリーンショット 2024-06-24 14 23 40](https://github.com/U-Yuri/mudamuda/assets/80314978/82775b10-5b6b-47de-8d3b-372545b267df)
## URL
https://mudazero.uezono.studio/
## アプリケーション概要
お金の無駄使いを減らし、ミニマリストを目指すアプリ。
物欲を減らす理論に基づき作成し、１ヶ月後に見返し本当に必要であれば購入、１ヶ月後に見返し欲しくないものであれば削除する、という趣旨のアプリ。
## 画面遷移図
![スクリーンショット 2024-06-24 15 02 23](https://github.com/U-Yuri/mudamuda/assets/80314978/93b3c887-a394-4965-9269-17b718f8a664)
## 使用方法
1. 新規登録しマイページにログイン。
2. 欲しいものを登録する（画像、商品名、金額）。
3. １ヶ月後にもう一度見直し購入するか、削除するか判断する。
## 使用技術
- ruby 3.1.2p20
- rails 7.0.8
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
