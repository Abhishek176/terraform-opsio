# Input Variables
variable "aws_region" {
  description = "AWS region"
  default = "us-east-1"
}
# App Name S3 Bucket used for
variable "app_name" {
  type = string
  description = "Application Name"
  default = "mynodeapp"
}
# Environment Name
variable "environment_name" {
  type = string
  description = "Environment Name"
  default = "prod"
}

variable "tags" {
  type = map(string)
  description = "Tags"
  default = {
    "Name" = "mynodeapp"
    "Env" = "Prod"
  }
}