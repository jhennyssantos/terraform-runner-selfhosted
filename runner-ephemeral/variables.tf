variable "environment" {
  description = "Environment name, used as prefix"

  type    = string
  default = null
}


variable "aws_region" {
  description = "AWS region."

  type    = string
  default = "us-east-1"
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "subnet_ids" {
  type = list(string)
}

variable "key_base64" {
  type = string
  default = ""
}

variable "app_id" {
  type = string
  default = ""
}
