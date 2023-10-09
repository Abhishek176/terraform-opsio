terraform {
  required_version = "1.5.7" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
    time = {
      source = "hashicorp/time"
      version = "~> 0.6.0"
    }
  }
}

# Provider Block

provider "aws" {
  region  = var.aws_region
  profile = "default"
}