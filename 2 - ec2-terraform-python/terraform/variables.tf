variable "aws_region" {
  type    = string
  default = "sa-east-1"
}

variable "aws_account_id" {
  type    = string
  default = "0001"
}

variable "service_name" {
  type    = string
  default = "catalog"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "bucket_remote_state" {
  type    = string
  default = "exemplo-2-remote-state"
}

variable "tag_name" {
  type    = string
  default = "exemplo_2"
}