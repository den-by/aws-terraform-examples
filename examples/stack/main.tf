provider "aws" {
  region = "us-east-1"
}

resource "random_string" "random" {
  length = 8
  special = false
  upper = false
  number = false
}

resource "aws_cloudformation_stack" "example_stack" {
  name = "example-stack"

  parameters = {
    BucketName = "example-bucket-${random_string.random.result}"
  }

  template_body = jsonencode({
    "Parameters" : {
      "BucketName" : {
        "Type" : "String",
        "Description" : "The name of the bucket to create"
      }
    },
    "Resources" : {
      "S3Bucket" : {
        "Type" : "AWS::S3::Bucket",
        "Properties" : {
          "BucketName" : {"Ref" : "BucketName"}
        }
      }
    }
  })
}
