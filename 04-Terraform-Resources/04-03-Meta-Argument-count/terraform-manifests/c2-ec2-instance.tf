# Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-00c6177f250e07ec1" # Amazon Linux
  instance_type = "t2.micro"
  count = 5

  tags = {
    "Name" = "web-${count.index}"
  }
}
