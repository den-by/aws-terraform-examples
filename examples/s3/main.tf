provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my-tf-test-bucket-sdfsadf" {
  bucket = "my-tf-test-bucket-sdfsadf"
}
