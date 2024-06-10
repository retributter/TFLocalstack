resource "aws_s3_bucket" "example" {
  bucket = "my-test-bucket"
  acl    = "private"
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.example.arn
}

output "bucket_id" {
  value = aws_s3_bucket.example.id
}