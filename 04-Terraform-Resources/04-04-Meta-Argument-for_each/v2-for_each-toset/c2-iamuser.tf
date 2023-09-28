# Create 4 IAM Users
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user

resource "aws_iam_user" "myuser" {
  for_each = toset([ "demo","test","abhishek","abc","demo" ])
  name = each.key

  tags = {
    tag-key = "tag-value"
  }
}

# each.key = each.value
