# SpringBoot 3 Nuxt3 Sample Project on Gitpod

# 環境
- Backend
  - Java OpenJDK Corretto-17.0.8
  - SpringBoot 3.1.2
- Frontend
  - Node v18.17.1
  - Nuxt 3.6.5
- Middleware
  - MySQL 8.1.0 
  - Redis 6.2.13
- その他
  - Adminer 4.8.1

本プロジェクト起動にはDockerやJDK、Nodeが必要です。
PCにセットアップしてない場合は本Readme末尾の「ローカルPCの環境セットアップ」を参考にしてください。
 
# 開発時のシステム構成図

![system.png](docs%2Fimg%2Fsystem.png)


Spring Boot3とNuxt.js3を用いたSPAによるサンプルアプリケーション。
本アプリケーションでは以下の画面・機能がある。

# 機能 
- ログイン時
  - ログイン
  - ユーザー一覧表示
- 非ログイン時
  - ログアウト
  - ログインユーザー取得
  - ユーザー登録
  - ユーザー更新（自分）
  - ユーザー削除（自分）

# アプリケーション起動

## Spring Boot起動と共にDockerコンテナも起動する（MySQL/Redisのコンテナ）

以下はコマンドで行う場合
```
./gradlew
./gradlew bootRun
```

※`./gradlew`は初回 or プラグイン追加時だけ実行

IntelliJやVSCodeの場合はIDE上の設定が必要

backend: https//8080-???.gitpod.io

## Nuxt起動

```
cd client/nuxt
npm install
npm run dev
```
※`npm install`は初回 or プラグイン追加時だけ実行

frontend: https://3000-???.gitpod.io
## 画面
- TOP
  - ユーザーの一覧表示
  - ![top.png](docs%2Fimg%2Ftop.png)
- Login
  - ユーザーログイン
  - ![login.png](docs%2Fimg%2Flogin.png)
- MyPage
  - ログアウト、ユーザー追加、更新(自分)、削除(自分)
  - ![mypage.png](docs%2Fimg%2Fmypage.png)

# DB操作

## DB Client
dockerでadminerを起動している。

adminerはDB操作ツール

https//8000-???.gitpod.io

にアクセスして、以下情報でDB接続する

- データベース種類: MySQL
- サーバ: mysql
- ユーザ名: myuser
- パスワード: secret
- データベース: mydatabase



## DBクリーンアップ
テーブル、データの削除を行う。

プロジェクト直下で以下実行
```
./gradlew flywayClean
```

## データ作成
テーブル、データの作成を行う。
userテーブルの作成と、サンプルデータが投入される。

プロジェクト直下で以下実行
```
./gradlew flywayMigrate
```

# サンプルプロジェクト動作確認TODO
cloneしたサンプルプロジェクトが正しく動作するかの確認TODO。
Java、Node、Docker等インストールされていない場合は、CONTRIBUTING.mdを参照ください。

1. [ ] `./gradlew`でspring起動に必要なプラグインインストール
2. [ ] springを起動させ、localhost:8080にアクセスできること
3. [ ] nuxtを起動させ、localhost:3000にアクセスできること
4. [ ] localhost:3000のログインページにアクセスし、ログインできること
5. [ ] マイページでログアウトできること
6. [ ] マイページでユーザー追加ができること
7. [ ] マイページでユーザー更新(自分)ができること
8. [ ] マイページでユーザー削除(自分)ができること
9. [ ] 追加したユーザーでログインできること

# ローカルPCの環境セットアップ(Gitpodを使わない場合)

ローカルPC（各々のPC）で動作させることを前提にしているので以下のインストールが、各自必要になります。

- Docker
- JDK
- Node

## Docker

### mac

以下よりインストールする
https://docs.docker.com/desktop/install/mac-install/

### windows

Windowsの場合は以下のサイト等を参考にインストールしてください。

https://docs.docker.jp/docker-for-windows/install.html

## JDK

SDKMANというツールで様々なバージョンのJDKをインストール可能なので、まずそれかインストールしてください。

https://sdkman.io/

SDKMANがインストールできたら、以下コマンドでJDKをインストールしていきます。

```
sdk install java 17.0.8-amzn
sdk default java 17.0.8-amzn
```

インストールが終わり、以下コマンド実行してjava17のバージョンが確認できれば成功です。
```
java --version
```

## Node

### mac
以下よりインストールコマンド実行しインストールしてください。
https://github.com/nvm-sh/nvm#installing-and-updating

### windows

以下より`nvm-setup.zip`をダウンロードしインストールしてください。
https://github.com/coreybutler/nvm-windows/releases

### 共通

正しくインストールされていば、以下でnvmバージョンが確認できます。
```
nvm --version
```

nvmを使ってNodeをインストールしていきます。
```
nvm install 18.17.1
nvm use default v18.17.1
```

以下でnodeのバージョンが確認できれば成功です。
```
node -v
```