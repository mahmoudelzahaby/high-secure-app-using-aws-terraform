
module "lb_public" {
  source = "./alb"

  target_name     = "public"
  target_port     = "80"
  target_protocol = "HTTP"
  target_vpc_id   = module.vpc.vpc-id

  attach_target_id   = { id1 = module.ec2-public.ec2_id, id2 = module.ec2-public.ec2_id-1 }
  attach_target_port = "80"

  lb_name           = "public"
  lb_internal       = false
  lb_type           = "application"
  lb_security_group = [module.security-group.sg]
  lb_subnet         = { id1 = module.vpc.subnet-id, id2 = module.vpc.subnet-id-0}

  listener_port     = "80"
  listener_protocol = "HTTP"
  listener_type     = "forward"

  depends_on = [
    module.vpc,
    module.ec2-public,
  ]

}
