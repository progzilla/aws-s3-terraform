terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.69.0"
    }
  }
  # configure remote storage for state file
  backend "s3" {
    bucket = "terrabucks"
    region = "eu-west-1"
    profile = "mcj-root" 
    key = "terrabucks/dev.terraform.tfstate"
    encrypt = true
  }
}

# cnfigure provider defaults
provider "aws" {
  # Configuration options
    region = "${var.aws_region}"
    profile = "${var.aws_profile}"
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_KEY_ID
}

# create the s3 bucket
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

# create and upload object to bucket 
resource "aws_s3_bucket_object" "object" {
    bucket = aws_s3_bucket.bucket.id
    key = "FillUs.mp3"
    source = "../../../Music/FillUs.mp3"
    acl = "public-read"
    # sample for multiple uploads
    # for_each = fileset("../../../Music/", "*")
    # etag = filemd5("../../../Music/${each.value}")
}

# outputs resulting arn url of the object (not wrking yet)
output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket_object.object.id
}