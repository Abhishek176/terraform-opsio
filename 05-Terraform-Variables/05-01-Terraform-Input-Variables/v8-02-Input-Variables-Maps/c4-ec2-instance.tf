# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = var.ec2_ami_id
  #instance_type          = var.ec2_instance_type[0]
  instance_type = var.ec2_instance_type_map["medium-apps"]
  key_name               = "terraform-key"
  count                  = var.ec2_instance_count
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to Apache ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = var.ec2_instance_tags
}



# default = {
#     "small-apps" = "t3.micro"
#     "medium-apps" = "t3.medium" 
#     "big-apps" = "t3.large"    
#   }
