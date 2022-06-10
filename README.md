<p>
 <img src="https://img.shields.io/badge/-HTML5-E34F26.svg?logo=html5&style=plastic">
 <img src="https://img.shields.io/badge/-CSS3-1572B6.svg?logo=css3&style=plastic">
 <img src="https://img.shields.io/badge/-JavaScript-F7DF1E.svg?logo=javascript&style=plastic">
 <img src="https://img.shields.io/badge/-Ruby-CC342D.svg?logo=ruby&style=plastic">
 <img src="https://img.shields.io/badge/-Rails-CC0000.svg?logo=rails&style=plastic">
 <img src="https://img.shields.io/badge/-jQuery-0769AD.svg?logo=jquery&style=plastic">
 <img src="https://img.shields.io/badge/-Bootstrap-563D7C.svg?logo=bootstrap&style=plastic">
 <img src="https://img.shields.io/badge/-RubyGems-E9573F.svg?logo=rubygems&style=plastic">
 <img src="https://img.shields.io/badge/-RSpec-CC0000.svg?logo=rails&style=plastic">
 <img src="https://img.shields.io/badge/-Google%20cloud-4285F4.svg?logo=google-cloud&style=plastic">
 <img src="https://img.shields.io/badge/-Heroku-430098.svg?logo=heroku&style=plastic">
 <img src="https://img.shields.io/badge/-VisualStudioCode-007ACC.svg?logo=visualstudiocode&style=plastic">
 <img src="https://img.shields.io/badge/-macOS-000000.svg?logo=&style=plastic">
</p>

# Scorer for Bowlers

Scorer for Bowlers(スコアラーフォーボウラーズ)はボウリング場毎に点数を登録することが出来るアプリケーションです。  
ボウリング場毎に点数を纏めることにより、  
「ここのボウリング場は得意にしているからどんどん大会に出よう！」  
「ここのボウリング場は少し点数が低いからしっかりと練習しよう！」という情報を客観的に把握し、  
ボウラーの方々の成績の向上に役立てて頂きたいと思い作成しました。

## 使い方

https://scorer-for-bowlers.herokuapp.com/ へアクセス。

新規登録を行いログイン後、ボウリング場の登録を行います。

ボウリング場の登録後スコアを入力し登録します。

スコアを複数登録すると自動的に最高点(MAX)平均点(AVE)が表示されます。

***デモ***
 
![port](https://user-images.githubusercontent.com/77609204/171316452-19ec4d05-b877-415b-b3ea-b6026e6760fb.gif)
 
## 機能
 
- 登録したボウリング場の住所を基にGoogle Mapが表示されます。
- 各ボウリング場にユーザー固有のスコアを表示します。
- 登録したスコアを基に最高点(MAX)と平均点(AVE)を計算して表示します。 
 
## ER図

![ER1](https://user-images.githubusercontent.com/77609204/171769613-46e5c1ea-608c-4b96-856c-46183d5d0d45.png)

## バージョン情報
 
- Ruby:3.0.2
- Rails:6.1.4
 
## インストール方法
 
$ git clone https://github.com/YusukeYoshida23/ybowl  
$ cd ybowl  
$ bundle install  
$ rails db:create  
$ rails db:migrate  
$ rails s
 
## 今後のアップデート予定

- JavaScript/jQueryを更に学び、Google Map上からボウリング場を検索し、そこからスコアを登録・閲覧ができるようにする。
- Kotlin、Swiftを学び、Android　、iPhoneに対応するアプリケーションにする。
- スマートフォンの位置情報を利用し、現在地からボウリング場をヒットさせ、そこからスコアを登録・閲覧ができるようにする。
- 解析技術を学び、スコアシートを撮影しスキャンするだけで自動的に点数が入力出来るようにする。
