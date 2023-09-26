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
  map_public_ip_on_launch = true

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
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    "Name" = "public_RT"
  }
}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.demo_igw.id
}
# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.public_sunet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private-association" {
  subnet_id      = aws_subnet.private_sunet.id
  route_table_id = aws_vpc.demo_vpc.default_route_table_id
}


# Resource-7: Create Security Group
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow ssh and http inbound traffic"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
}
