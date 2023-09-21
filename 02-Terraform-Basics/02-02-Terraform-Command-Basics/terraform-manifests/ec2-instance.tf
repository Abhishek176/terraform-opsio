# Terraform Settings Block
terraform {
  required_version = "1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# Resource Block
resource "aws_instance" "demo" {
  ami           = "ami-00c6177f250e07ec1"
  instance_type = "t2.micro"

  tags = {
    "Name" = "Demo"
  }
}



# comment:

# # This is a comment

# // this is also comment

# /*
# line1
# line2
# line3
# */