# Resource Block to Create VPC in us-west-
resource "aws_vpc" "demo1_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  provider = aws.ap-south-1

  tags = {
    "Name" = "ap-south-1"   
  }
}

/*
Additional Note: 
provider = <PROVIDER NAME>.<ALIAS>  # This is a Meta-Argument from Resources Section nothing but a Special Argument
*/