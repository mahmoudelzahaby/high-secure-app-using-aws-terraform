output "lb_public_dns" {
  value = aws_lb.app_lb.dns_name
}