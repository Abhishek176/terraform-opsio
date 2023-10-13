# locals {
#   ports = [10,20,80,50,8080]
# }

variable "ports" {
  type = list(string)
  default = [10,20,80,50,8080]
}

resource "aws_security_group" "allow_ports" {
  name        = "dynamic-block-demo"
  description = "dynamic-block-demo"

  dynamic "ingress" {
    for_each = var.ports
    content {
      description      = "TLS from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  # each.key = ingress.key
  # each.value = ingress.value

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "dynamic-block-demo"
  }
}