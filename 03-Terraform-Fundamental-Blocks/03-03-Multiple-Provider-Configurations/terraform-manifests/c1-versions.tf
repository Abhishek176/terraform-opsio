# Terraform Block
terraform {
  required_version = "1.5.7"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  profile = "default"
  region = "us-east-1"
}

provider "aws" {
  profile = "default"
  region = "ap-south-1"
  alias = "ap-south-1"
}


# Provider-2 for us-west-1



