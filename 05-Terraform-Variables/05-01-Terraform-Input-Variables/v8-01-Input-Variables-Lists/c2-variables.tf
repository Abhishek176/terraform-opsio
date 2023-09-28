# Input Variables
variable "region" {
  type = string
  description = "AWS region"
  default = "us-east-1"
}

variable "ami_id" {
  type = string
  description = "AWS AMI ID"
  default = "ami-00c6177f250e07ec1"
}

# variable "instance_type" {
#   type = string
#   description = "instance type"
#   # default = "t2.medium"
# }


variable "instance_type" {
  type = list(string)
  description = "instance type"
  default = [ "t2.micro","t2.medium","t2.large" ]
}