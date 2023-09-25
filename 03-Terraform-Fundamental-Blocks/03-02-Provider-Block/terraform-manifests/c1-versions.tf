# Terraform Block
terraform {
  required_version = "1.5.7"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region = "us-east-1"
}


/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
