# Firebase Hosting プレビュー

この Issue の対応は任意です。

このプロジェクトでは `apps/catalog` の Widgetbook を PullRequest 時にプレビューできるようにするワークフローが用意されています。
プレビューは Firebase 上にデプロイされます。

ワークフローを有効化するためには、以下の手順に従って設定してください。

![firebase-hosting-preview-01.png](https://github.com/user-attachments/assets/f77a9a75-a75f-4fb2-a469-0b0346c1f9cd)

## 1. 新規Firebaseプロジェクトの作成

[ドキュメント][1] に従ってFirebaseプロジェクトを作成します。

## 2. Firebase Hosting の初期化

[ドキュメント][2] に従ってFirebase Hostingを初期化します。

## 3.プロジェクトのFirebase Hosting 設定を更新する

以下のコマンドを実行する。

```shell
firebase init hosting:github
```

以下の出力を参考にセットアップを完了する。

```shell
$ firebase init hosting:github

     ######## #### ########  ######## ########     ###     ######  ########
     ##        ##  ##     ## ##       ##     ##  ##   ##  ##       ##
     ######    ##  ########  ######   ########  #########  ######  ######
     ##        ##  ##    ##  ##       ##     ## ##     ##       ## ##
     ##       #### ##     ## ######## ########  ##     ##  ######  ########

You're about to initialize a Firebase project in this directory:

Before we get started, keep in mind:

  * You are initializing within an existing Firebase project directory


=== Project Setup

First, let's associate this project directory with a Firebase project.
You can create multiple project aliases by running firebase use --add, 
but for now we'll just set up a default project.

i  Using project flutter-project

=== Hosting:github Setup

i  Detected a .git folder at /path
i  Authorizing with GitHub to upload your service account to a GitHub repository's secrets store.

Visit this URL on this device to log in:
https://github.com/login/oauth/authorize?client_id=

Waiting for authentication...

✔  Success! Logged into GitHub as username

? For which GitHub repository would you like to set up a GitHub workflow? (format: user/repository) username/repository

✔  Created service account github-action-XXXXXXXXX with Firebase Hosting admin permissions.
✔  Uploaded service account JSON to GitHub as secret FIREBASE_SERVICE_ACCOUNT_XXXX.
i  You can manage your secrets at https://github.com/username/repository/settings/secrets.

? Set up the workflow to run a build script before every deploy? No
? GitHub workflow file for PR previews exists. Overwrite? firebase-hosting-pull-request.yml No
? Set up automatic deployment to your site's live channel when a PR is merged? No

i  Action required: Visit this URL to revoke authorization for the Firebase CLI GitHub OAuth App:
https://github.com/settings/connections/applications/89cf50f02ac6aaed3484
i  Action required: Push any new workflow file(s) to your repo

i  Writing configuration info to firebase.json...
i  Writing project information to .firebaserc...

✔  Firebase initialization complete!
```

## 4. ワークフローの内容を変更する

`.github/workflows/firebase-hosting-pull-request.yaml` を修正する。

### 4-1. リポジトリ名条件の削除

このテンプレートプロジェクトを元に新規プロジェクトを作成した際に、誤ってワークフローが実行されないように、リポジトリ名による有効化条件を記述しています。この記述はセットアップ後は不要になりますので、削除してください。

![firebase-hosting-preview-02.png](https://github.com/user-attachments/assets/04475d96-986d-44de-b945-25c4308b5d26)

### 4-2. Firebase　Service Account名の変更

`firebase init hosting:github`コマンドで作成したFirebaseサービスアカウント名に置き換えてください。

![firebase-hosting-preview-03.png](https://github.com/user-attachments/assets/89246f05-b099-4f46-9308-de3063704258)

### 4-3. projectIdを該当プロジェクトのIDに変更する

Firebaseプロジェクトを置き換える。

![firebase-hosting-preview-04.png](https://github.com/user-attachments/assets/b36cc6e3-fa83-4c61-a55f-59c4e7c0e5e6)

<!-- Links -->

[1]: https://firebase.google.com/docs/web/setup

[2]: https://firebase.google.com/docs/hosting/quickstart
