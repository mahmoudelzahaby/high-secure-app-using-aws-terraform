module "ec2-public" {
  source                           = "./ec2"
  ami-ec2                          = "ami-0b5eea76982371e91"
  instance_type-1                  = "t2.micro"
  id-subnet                        = [module.vpc.subnet-id, module.vpc.subnet-id-0]
  key-name                         = "key-pair"
  pub-ip                           = true
  sg-id                            = module.security-group.sg
  ec2-name                         = var.ec2-public
  ec2_connection_type              = "ssh"
  ec2_connection_user              = "ubuntu"
  ec2_connection_private_key       = "./key-pair.tf"
  ec2_provisioner_file_source      = "./nginx.sh"
  ec2_provisioner_file_destination = "/tmp/nginx.sh"
  ec2_provisioner_inline           = ["chmod 777 /tmp/nginx.sh", "/tmp/nginx.sh ${module.lb_private.lb_public_dns}"]
}

module "security-group" {
  source = "./security"
  vpc-id = module.vpc.vpc-id
}

