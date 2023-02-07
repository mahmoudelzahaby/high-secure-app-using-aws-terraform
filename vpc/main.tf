resource "aws_vpc" "vpc" {
  cidr_block = var.cidr-vpc

  tags = {
    "Name" = var.name-vpc
  }
}

resource "aws_subnet" "subnets" {
  count = length(var.subnet-cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet-cidr[count.index]
}



