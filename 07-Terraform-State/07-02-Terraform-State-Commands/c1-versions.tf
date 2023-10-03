# Terraform Block
terraform {
  required_version = "1.5.7" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }

  # backend "s3" {
  #   bucket = "myterraform-backend-bucket-11"
  #   key    = "terraform.tfstate"
  #   region = "us-east-1"

  #   dynamodb_table = "terraform-backend"
  # }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
