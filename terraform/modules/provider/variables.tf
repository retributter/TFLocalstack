variable "aws_access_key" {
  description   = "The AWS access key"
  type          = string
  sensitive     = true
}

variable "aws_secret_key" {
  description   = "The AWS secret key"
  type          = string
  sensitive     = true
}

variable "aws_region" {
  description   = "The AWS region"
  type          = string
  default       = "us-east-1"
  sensitive     = true
}