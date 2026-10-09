variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.59.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.59.1.0/24"
}

variable "publicip" {
  description = "Public IP address for SSH access"
  type        = list(string)
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
