
module "lb_private" {
  source = "./alb"

  target_name     = "private"
  target_port     = "80"
  target_protocol = "HTTP"
  target_vpc_id   = module.vpc.vpc-id

  attach_target_id   = { id1 = module.ec2_private_01.ec2-id, id2 = module.ec2_private_01.ec2-id-1 }
  attach_target_port = "80"

  lb_name           = "private"
  lb_internal       = true
  lb_type           = "application"
  lb_security_group = [module.security-group.sg]
  lb_subnet         = { id1 = module.vpc.subnet-id-2, id2 = module.vpc.subnet-id-3}
  listener_port     = "80"
  listener_protocol = "HTTP"
  listener_type     = "forward"

  depends_on = [
    module.vpc,
    module.ec2_private_01,
  ]

}