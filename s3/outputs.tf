output "bucket-arn" {
  value = aws_s3_bucket.tf-state.arn
}

output "bucket-name" {
  value = aws_s3_bucket.tf-state.bucket
}