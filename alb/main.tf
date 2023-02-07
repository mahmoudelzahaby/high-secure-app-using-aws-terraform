

resource "aws_lb_target_group" "ec2_target" {
  name     = var.target_name 
  port     = var.target_port 
  protocol = var.target_protocol
  vpc_id   = var.target_vpc_id 
}

resource "aws_lb_target_group_attachment" "ec2_targr_attach" {
  target_group_arn = aws_lb_target_group.ec2_target.arn
  for_each = var.attach_target_id
  target_id        = each.value 
  port             = var.attach_target_port 
  depends_on = [
    aws_lb_target_group.ec2_target
  ]
}

resource "aws_lb" "app_lb" {
  name               = var.lb_name 
  internal           = var.lb_internal 
  load_balancer_type = var.lb_type 
  security_groups    = var.lb_security_group 
  subnets            = [for subnet in var.lb_subnet : subnet.subnet_id]
  tags = {
    Name = var.lb_name 
  }
}

resource "aws_lb_listener" "listener_app_tar" {
  load_balancer_arn = aws_lb.app_lb.arn 
  port              = var.listener_port 
  protocol          = var.listener_protocol 
  default_action {
    type             = var.listener_type 
    target_group_arn = aws_lb_target_group.ec2_target.arn 
  }
  depends_on = [
    aws_lb.app_lb,
    aws_lb_target_group.ec2_target
  ]
}