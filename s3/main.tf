resource "aws_s3_bucket" "tf-state" {
  bucket = var.bucket-name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.tf-state.id
  versioning_configuration {
    status = var.status
  }
}