output "ec2_public_ip" {
  description = "EC2 public IP"
  value = aws_instance.my-ec2-vm.*.public_ip
}


output "ec2_public_dns" {
  description = "EC2 public DNS"
  value = aws_instance.my-ec2-vm.*.public_dns
}


# aws_instance.my-ec2-vm[0]
# aws_instance.my-ec2-vm[1]





# ec2_public_ip=120.1.0.5