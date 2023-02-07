module "dynamo" {
  source        = "./dynamodb"
  dynamodb-name = "terraform-update-and-run-state"

}