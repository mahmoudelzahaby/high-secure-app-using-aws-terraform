module "igw" {
  source = "./igw"
  vpc-id = module.vpc.vpc-id
}