# 必要なもの
## WebSocket Server
端末間でリアルタイムにデータ通信する拠点として利用します。
# 準備
## WebSocket Serverの作成
色々な作成方法がありますが、ここではプロトタイプに使う程度の性能のWeb Socket Serverを無料で作成できるherokuを使った手順を示します。
1. heroku アカウントの作成
herokuのアカウントを持っていない場合は、まずアカウントを作成してください
⇒ https://signup.heroku.com/jp

2. node-websocketアプリケーションをherokuにデプロイ
node.jsで実装したWebSocketのサンプルがあるので、これをherokuにデプロイします
https://github.com/heroku-examples/node-websockets
このページの「Deploy to Heroku」を押します

## 必要に応じて
- heroku(https://www.heroku.com/) のアカウント
プロトタイプに使う程度の性能のWeb Socket Serverを無料で作成することができます。
利用規模に応じて費用が発生します。個人でプロトタイプ作ったり動作確認する分には無料プランの範囲で使えると思います。
