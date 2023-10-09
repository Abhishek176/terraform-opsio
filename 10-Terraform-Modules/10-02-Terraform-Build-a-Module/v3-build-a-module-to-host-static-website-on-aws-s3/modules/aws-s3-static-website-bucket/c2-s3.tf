resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.mybucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_ownership,
    aws_s3_bucket_public_access_block.bucket_public_access,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_ownership,
    aws_s3_bucket_public_access_block.bucket_public_access,
    aws_s3_bucket_acl.bucket_acl,
    aws_s3_bucket_website_configuration.static_website,
  ]
  create_duration = "30s"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  depends_on = [ time_sleep.wait_30_seconds ]
  bucket = aws_s3_bucket.mybucket.id
  policy = file("policy/s3-policy.json")
}