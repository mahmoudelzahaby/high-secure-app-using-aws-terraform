module "vpc" {
  source      = "./vpc"
  cidr-vpc    = "10.0.0.0/16"
  name-vpc    = "vpc-iti-1"
  subnet-cidr = ["10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  az-subnet = ["us-east-2a","us-east-2a","us-east-2b","us-east-2b"]
}
