terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }

#   backend "s3" {
#     bucket = var.bucket_remote_state
#     key    = "dev/terraform.tfstate"
#     region = "sa-east-1"
#   }
}


provider "aws" {
  shared_credentials_files = ["/home/devback/.aws/credentials"]
  region                   = var.aws_region
}

# resource "aws_s3_bucket_versioning" "this" {
#   bucket = aws_s3_bucket.this.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket" "this" {
#   bucket = var.bucket_remote_state
#   tags = {
#     Name = "exemplo_2"
#     Env  = "dev"
#   }
# }