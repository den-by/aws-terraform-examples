provider "aws" {
  region = "us-east-1"
}

resource "random_string" "random" {
  length = 8
  special = false
  upper = false
  number = false
}

resource "aws_s3_bucket" "my-tf-test-bucket" {
  bucket = "my-tf-test-bucket-${random_string.random.result}"
  lifecycle {
   prevent_destroy = true
 }
}
