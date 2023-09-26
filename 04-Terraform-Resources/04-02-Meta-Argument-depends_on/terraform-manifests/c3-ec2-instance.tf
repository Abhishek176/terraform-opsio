resource "aws_instance" "web" {
  ami           = "ami-00c6177f250e07ec1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_sunet.id
  key_name = "demo"
  vpc_security_group_ids = [ aws_security_group.web_sg.id ]
  user_data = file("${path.module}/apache-install.sh")

  tags = {
    Name = "webserver"
  }
}