resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc-id
  tags = {
    "key" = "route table"
  }
}
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.des-all
  gateway_id             = module.igw.igw
}

resource "aws_route_table_association" "public" {
  subnet_id      = module.vpc.subnet-id-0
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-1" {
  subnet_id      = module.vpc.subnet-id
  route_table_id = aws_route_table.public.id
}