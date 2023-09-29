# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "ami_id" {
    owners = [ "amazon" ]
    most_recent = true

    filter {
      name = "architecture"
      values = [ "x86_64" ]
    }

    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }

    filter {
      name = "root-device-type"
      values = [ "ebs" ]
    }
}