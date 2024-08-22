terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  shared_credentials_files = ["/home/boibandidoorigins/.aws/credentials"]
  region                   = "sa-east-1"
}
