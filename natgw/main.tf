resource "aws_nat_gateway" "gw" {

  allocation_id = var.eip-ip
  subnet_id     = var.sub-id
}