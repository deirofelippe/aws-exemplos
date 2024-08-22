terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tutorial-tf-remote-state"
    key    = "dev/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  shared_credentials_files = ["/home/boibandidoorigins/.aws/credentials"]
  region                   = "sa-east-1"
}

variable "bucket_remote_state" {
  default = "tutorial-tf-remote-state"
  type    = string
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_remote_state
  tags = {
    Name = "tutorial_s3"
    Env  = "dev"
  }
}