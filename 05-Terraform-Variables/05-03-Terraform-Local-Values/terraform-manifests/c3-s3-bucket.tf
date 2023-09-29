# Create S3 Bucket - with Input Variables 
# resource "aws_s3_bucket" "mybucket" {
#   bucket = "${var.app_name}-${var.environment_name}-bucket"

#   tags = var.tags
# }

# Define Local Values
locals {
  bucket_name = "${var.app_name}-${var.environment_name}-bucket"
}



# Create S3 Bucket - with Input Variables & Local Values

resource "aws_s3_bucket" "mybucket" {
  bucket = local.bucket_name

  tags = var.tags
}
