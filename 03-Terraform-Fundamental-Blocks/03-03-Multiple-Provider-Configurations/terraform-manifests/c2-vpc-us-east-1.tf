# Resource Block to Create VPC in us-east-1 which uses default provider
resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "us-east-1"
  }
}