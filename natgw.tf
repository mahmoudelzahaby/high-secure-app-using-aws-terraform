module "eip" {
  source = "./eip"
}

module "nat-gw" {
  source = "./natgw"
  eip-ip = module.eip.eip
  sub-id = module.vpc.subnet-id
}