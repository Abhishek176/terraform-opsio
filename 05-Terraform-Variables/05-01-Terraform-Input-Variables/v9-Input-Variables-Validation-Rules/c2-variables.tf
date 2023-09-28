# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-1234567" # Amazon2 Linux AMI ID
  validation {
    condition = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id,0,4) == "ami-"
    error_message = "ami id should have atlease 8 character and it should start with ami-"
  }
}


variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 2
}

/*
variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type = list(string)
  default = ["t3.micro", "t3.small", "t3.large"]
}
*/


variable "ec2_instance_tags" {
  description = "EC2 Instance Tags"
  type = map(string)
  default = {
    "Name" = "ec2-web"
    "Tier" = "Web"
  }
}

