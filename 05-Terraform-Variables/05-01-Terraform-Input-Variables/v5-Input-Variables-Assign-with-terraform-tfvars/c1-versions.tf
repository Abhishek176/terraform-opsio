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

# Provider Block
provider "aws" {
  profile = "default"
  region = var.region
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
