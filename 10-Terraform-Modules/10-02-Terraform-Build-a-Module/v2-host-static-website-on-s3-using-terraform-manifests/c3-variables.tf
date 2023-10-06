variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "ami_id" {
  type = string
  default = "ami-067d1e60475437da2"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}