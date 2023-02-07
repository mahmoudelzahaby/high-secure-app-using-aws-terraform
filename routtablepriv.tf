
resource "aws_route_table" "private" {
  vpc_id = module.vpc.vpc-id

  tags = {
    "key" = "route table private"
  }
}

resource "aws_route" "private-natgw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = var.des-all
  nat_gateway_id         = module.nat-gw.natgw-id
}

resource "aws_route_table_association" "private-2" {
  subnet_id      = module.vpc.subnet-id-2
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-3" {
  subnet_id      = module.vpc.subnet-id-3
  route_table_id = aws_route_table.private.id
}