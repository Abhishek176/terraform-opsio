resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type[1]
  key_name = "demo"
  vpc_security_group_ids = [ aws_security_group.web_sg.id,aws_security_group.ssh_sg.id ]

  tags = {
    Name = "webserver"
  }
}
