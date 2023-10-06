#! /bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd 
echo "<h1>Welcome to Apache ! AWS Infra created using Terraform in us-east-1 Region</h1>" | sudo tee /var/www/html/index.html