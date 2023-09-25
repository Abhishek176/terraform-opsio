# Resources Block
# Resource-1: Create VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "demo_vpc" 
    "Env" = "Prod"
  }
}

# Resource-2: Create Subnets
resource "aws_subnet" "public_sunet" {
  vpc_id = aws_vpc.demo_vpc.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.0/24"

  tags = {
    "Name" = "public_subnet"
  }
}

resource "aws_subnet" "private_sunet" {
  vpc_id = aws_vpc.demo_vpc.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.1.0/24"

  tags = {
    "Name" = "private_subnet"
  }
}

# Resource-3: Internet Gateway
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    "Name" = "demo_igw"
  }
}

# Resource-4: Create Route Table


# Resource-5: Create Route in Route Table for Internet Access


# Resource-6: Associate the Route Table with the Subnet


# Resource-7: Create Security Group
