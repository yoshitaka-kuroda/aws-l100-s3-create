#【L100相当】S3バケット構築ハンズオン

```
 aws-l100-s3
    ├── README.md
    ├── main.tf
    ├── output.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── terraform.tfvars
    ├── variables.tf
    └── versions.tf
 ```

##  手順

0.aws configureをしてIAMユーザーを認識させましょう。
    aws configure

    AWS Access Key ID : コンソールで作成したIAMユーザーで確認したものを入力
    AWS Secret Access Key :　IAMユーザー作成時のみしか表示されないシークレットを入力(作成時しか確認できないのでなくさないように)　 
    Default region name :ap-northeast-1   東京リージョンで入力 
    Default output format :json     jsonで指定が推奨(王道)

　　---------------
    
    aws sts get-caller-identity　　このコマンドで正しくconfigureできてるか確認


1.変数ファイル  terraform.tfvarsを作成し、バケット名を指定(グローバルに一意)
    bucket_name "好きな名前の一意のS3バケット名

2.初期化と実行
    terraform init
    terraform validate
    terraform plan
    terraform apply

3.作成後、AWSコンソールでS3バケットの作成ができてるか確認

4.最後は綺麗にS3バケットを削除しましょう。
    terraform destroy

5.Githubにアップしてみましょう。GitHubアカウント作成後SSHキーを作ります。
    ssh-keygen -t ed25519 -C "メールアドレスだったり、任意の名前を入力"

6.公開鍵を出力し、GitHubにブラウザでアクセスしSSHキーを登録
    cat ~/.ssh/id_ed25519.pub
    出力されたものをブラウザでGitHubにアクセスし登録

7.GitHubにCLIでログイン
    gh auth login
? You're already logged into github.com. Do you want to re-authenticate? 
:Yes

? What is your preferred protocol for Git operations? 
:SSH

? Upload your SSH public key to your GitHub account?
:作成したed25519.pubを選択(公開鍵)

? How would you like to authenticate GitHub CLI? Login with a web browser
:Login with a web browser

8.「https://github.com/login/device/success」へアクセスし、「First copy your one-time code:」に表示されたコードを入力し認証する。

9.GitHubに新規リポジトリ作成　(aws-l100-s3-createの部分は変更)
gh repo create aws-l100-s3-create --public

10.Git管理を開始しGitHubにアップロード

cd /home/wsl/aws-terraform-project/S3バケット作成/aws-l100-s3  # プロジェクトディレクトリへ移動

git init                       # ★ ここでGitリポジトリ初期化
git add .                      # ファイルをすべてステージ
git commit -m "Initial commit" # 最初のコミット
git remote add origin https://github.com/【あなたのユーザー名】/aws-l100-s3-create.git
git branch -M main
git push -u origin main        # GitHubへアップロード


11.README内にディレクトリツリーをつくるために、treeコマンドのインストールをしておきましょう。

sudo apt update
sudo apt install tree

インストール完了後下記を実行

tree -a -L 2

特定のディレクトリだけツリー化したい場合：
tree aws-l100-s3-create -L 2


12.(その他)　アップデートしたファイルがあったら、コミットしてプッシュして上書きしましょう。
git add README.md       README.md部分はピンポイントでアップデートしたものがあれば指定　ない場合はgit add でOK
git commit -m "update README"　　こちらも上記同様
git push origin main

複数ファイルを編集していて全部アップデートしたいときは
git add .                # すべての変更ファイルをステージング
git commit -m "まとめて更新"  # 変更内容をコミット（コメントは分かりやすく）
git push origin main     # リモート（GitHub）に反映
