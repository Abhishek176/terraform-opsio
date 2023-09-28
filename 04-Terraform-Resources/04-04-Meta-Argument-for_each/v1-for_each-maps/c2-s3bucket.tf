# Create S3 Bucket per environment with for_each and maps
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "demo_bucket" {
  for_each = {
    "dev" = "mydapp-1122",
    "stage" = "mysapp-1122",
    "prod" = "mypapp-1122"
  }

  bucket = "${each.key}-${each.value}-bucket"

  tags = {
    "Name" = "demo",
    "Env" = "Prod"
  }
}

# each.key
# each.value

# dev-mydapp-1122-bucket
# stage-mydapp-1122-bucket
# prod-mydapp-1122-bucket
