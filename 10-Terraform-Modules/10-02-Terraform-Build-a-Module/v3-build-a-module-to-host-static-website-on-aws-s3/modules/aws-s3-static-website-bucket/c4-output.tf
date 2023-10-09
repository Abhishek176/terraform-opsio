output "bucket_name" {
  value = aws_s3_bucket.mybucket.id
}

output "website_domain_name" {
  value = aws_s3_bucket_website_configuration.static_website.website_endpoint
}