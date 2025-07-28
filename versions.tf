terraform {
    required_version = ">= 1.0"  #terraform本体のバージョン指定
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = ">=4.0"
      }
    }
}

provider "aws" {
    region = "ap-northeast-1"
}