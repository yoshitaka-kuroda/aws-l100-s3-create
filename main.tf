resource "aws_s3_bucket" "this" {   #S3バケットリソース作成
  bucket = var.bucket_name  #変数からバケット名を設定
  force_destroy = true  #バケット内のオブジェクトも強制削除
}