# Create EC2 Instnace Resource
resource "aws_instance" "web" {
  ami = "ami-067d1e60475437da2"
  instance_type = "t2.micro"

  tags = {
    "Name" = "demo"
  }
}