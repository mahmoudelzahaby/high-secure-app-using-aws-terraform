module "s3-backend" {
  source      = "./s3"
  bucket-name = "terraform-update-and-run-state"
  status      = "Enabled"
}

# terraform {
#   backend "s3" {
#     #put your s3 here
#     bucket = "terraform-update-and-run-state"
#     key    = "dev/terraform.tfstate"
#     region = "us-east-1"


#     #put your dynamodb here
#     dynamodb_table = "terraform-update-and-run-state"
#     encrypt         = true
#   }
# }