resource "aws_dynamodb_table" "name" {
  name         = var.dynamodb-name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "lockID"

  attribute {
    name = "lockID"
    type = "S"
  }
}
