# SKATE AND SENTO
<img width="543" alt="top-90981b7af55a4b82064d98f2160550d2a92a8961c4b59a457a823fbfea657daa" src="https://github.com/fuguita/skate_and_sento/assets/126998671/3e11ad61-b629-4a00-bccf-ea922b621f95">
<img width="1049" alt="b2d40b04f9412726eb36941b9d22e9a9" src="https://github.com/fuguita/skate_and_sento/assets/126998671/5182cdd7-7195-4dd8-81e5-5e91781e55a8">

## サイト概要
### URL
ログイン画面より'ゲストユーザー'としてログインできます。<br>
https://skate-and-sento.jp<br>
管理者側:<br>
https://skate-and-sento.jp/admin/sign_in
### サイトテーマ
特定の地域(大阪、京都）での各スケートボードのパーク情報とそれに付随したパーク付近の銭湯情報の閲覧、お気に入り登録、コメント、レビュー閲覧投稿ができ、
またユーザーが特定のエリア外にいった時、そのスケートパークと銭湯の投稿ができ、情報共有できるコミュニティーサイト。

### テーマを選んだ理由
スケートボードを趣味でやっており、どこのスケートパークに行こうか悩んだ時にパーク情報がわかるサイトがあればと思ったのと、最近銭湯ブームであると同時に
スケート後に銭湯に行くスケーターが多くなったので、スケートパーク、銭湯のどちらの情報も兼ね備えたサイトがあれば便利だなと感じていました。
また、このサイトを通じて自身では知り得なかった情報を得て、知らない地でスケートをする楽しみ、その場でしか味わえない銭湯の雰囲気などを感じてもらい、
今までにないスケートライフ、銭湯ライフの向上を目指せればと思いこのテーマにしました。

### ターゲットユーザ
- 大阪、京都でスケートしようと思っているスケーター
- 銭湯好きのスケーター
- どこのパークに行くか迷ったスケーター
- スケート後に銭湯に行きたくなったスケーター
- スケート初心者でどこのパークが良いかわからないビギナー
- 銭湯に興味を持っているスケーター
- 単なる銭湯好きの人はニーズとして当てはまリません。

### 主な利用シーン
- 大阪または京都のスケートパークを探している時
- スケート後に銭湯に行きたい時
- 該当のスケートパークの付近に銭湯があるか知りたい時
- サイトに掲載されているパークの詳細情報を知りたい時
- サイトに掲載されている銭湯の詳細情報を知りたい時
- ユーザーが特定エリア外のパークと銭湯に行った情報を投稿したい時
- ユーザーがお気に入り登録したパーク、銭湯の確認をしたい時


## 設計書
### 実装機能リスト
https://docs.google.com/spreadsheets/d/1j8Fz5R7dJ8FcKShHYTUUL16fmkNoU30n2THZ8nq-MTw/edit?usp=sharing
### ER図
https://drive.google.com/file/d/16kR3tag_KZSZh8XlMxeXHBG0k62xZH9x/view?usp=sharing
### テーブル定義書
https://docs.google.com/spreadsheets/d/1xBXcEmT8bCuUD_H-64jm3XCfuC3Po1M9FwWY5NRyvrI/edit?usp=sharing
### アプリケーション詳細設計
https://docs.google.com/spreadsheets/d/1gnH0a-M_rXGNwsNiJ3_9NnkvIl4kbAuU4GnDjZ1fItI/edit?usp=sharing
### ワイヤーフレーム
ユーザーサイド:https://drive.google.com/file/d/16xm8ZubtDlCHNv8_esTf2z4N_2eOp9F-/view?usp=sharing<br>
管理者サイド:https://drive.google.com/file/d/1ynX-Un57J92iQKvDt_gBURwjqOcXHisw/view?usp=sharing
### Ul Flow
ユーザー:https://drive.google.com/file/d/19MRfqaHEKmn8AXxbSFD_2s4WfhSD_Ff2/view?usp=sharing<br>
管理者:https://drive.google.com/file/d/1GsAfNymSlCxNYaa1fsAEEOH-KyGqVKKM/view?usp=sharing


## 環境・使用技術
### 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
### 本番環境
- AWS (EC2、RDS、Route53、CloudWatch、S3、Lambda)
- MySQL
- Nginx、 Puma
### その他使用技術
- 非同期通信
- 外部API(Google MapAPI)
- HTTPS接続 (Certbot)
- Rubocop-airbnb
- GitHub Actions
## 使用素材
画像使用元URL一覧
- 自身で撮影した画像
- Pixabay(https://pixabay.com/ja/)
## アプリケーションを作ってみて
制限をかけて表示・非表示や条件に合った件数の表示など細かな部分や今まで実装したことがなかった<br>
部分には苦労しました。それに伴い新しい多くの発見、学びがあり非常に楽しい制作になりました。
