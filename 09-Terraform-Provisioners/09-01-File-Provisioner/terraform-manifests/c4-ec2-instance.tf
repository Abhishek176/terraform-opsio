# Create EC2 Instance - Amazon2 Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  instance_type = var.instance_type
  key_name      = "demo"
	# user_data = file("apache-install.sh")  
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "web"
  }
# PLAY WITH /tmp folder in EC2 Instance with File Provisioner
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("private-key/demo.pem")
    host     = "${self.public_ip}"
  }

  # aws_instance.my-ec2-vm = self.public_ip
 
 # Copies the file-copy.html file to /tmp/file-copy.html
#   provisioner "file" {
#     source = "apps/file-copy.html"
#     destination = "/tmp/file-copy.html"
#  }
 
#   # Copies the string in content into /tmp/file.log
#   provisioner "file" {
#     content = "ami id: ${self.ami}"
#     destination = "/tmp/file.log"
#   }
  

#   # Copies the app1 folder to /tmp - FOLDER COPY
#   provisioner "file" {
#     source = "apps/app1"
#     destination = "/tmp/"
#  }

#   # Copies all files and folders in apps/app2 to /tmp - CONTENTS of FOLDER WILL BE COPIED
#   provisioner "file" {
#     source = "apps/app1/"
#     destination = "/tmp/"
#  }
  provisioner "file" {
    source = "apps/index.html"
    destination = "/tmp/index.html"
 }


  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/"
    ]
  }

  # provisioner "local-exec" {
  #   command = "echo '${self.public_ip}' >> public_ip.txt"
  #   working_dir = "output"
  # }

  # provisioner "local-exec" {
  #   command = "echo 'infra has been destroyed' > destroy.txt"
  #   working_dir = "output"
  #   when = destroy
  # }


/*
# Enable this during Section 09-01 Step-05
 # Copies the file-copy.html file to /var/www/html/file-copy.html where ec2-user don't have permission to copy
 # This provisioner will fail but we don't want to taint the resource, we want to continue on_failure
  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/var/www/html/file-copy.html"
    #on_failure  = continue  # Enable this during Test-2
   }
*/ 
}


# resource "null_resource" "demo" {
#   provisioner "" {
    
#   }
# }






