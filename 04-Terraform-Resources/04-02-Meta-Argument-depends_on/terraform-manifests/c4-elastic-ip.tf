resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id

  depends_on = [ aws_internet_gateway.demo_igw ]
}