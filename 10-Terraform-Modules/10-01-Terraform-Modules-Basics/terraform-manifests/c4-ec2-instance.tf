module "aws_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  ami = data.aws_ami.amzlinux.id
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id , aws_security_group.vpc-web.id ]
  availability_zone = "us-east-1a"
  user_data = file("apache-install.sh")
  key_name = "demo"

  tags = {
    Name = "Web"
  }
}