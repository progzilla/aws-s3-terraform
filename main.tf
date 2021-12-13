terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.69.0"
    }
  }
  backend "s3" {
    bucket = "terrabucks"
    region = "eu-west-1"
    profile = "mcj-root" 
    key = "terrabucks/dev.terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  # Configuration options
    region = "${var.aws_region}"
    profile = "${var.aws_profile}"
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_KEY_ID
}

resource "aws_s3_bucket" "bucket" {
  bucket = "ghm-music-upload"
  acl = "private"
  versioning {
    enabled = true
  }
  tags = {
    "Name" = "GHM Music"
    "Env"  = "Published"
  }
}

resource "aws_s3_bucket_object" "object" {
    bucket = aws_s3_bucket.bucket.id
    key = "Blessing.mp3"
    source = "../../../Music/Blessings.mp3"
    # for_each = fileset("../../../Music/", "*")
    acl = "public-read"
    # etag = filemd5("../../../Music/${each.value}")
}

output "arn" {
  # get object arn url 
}