output "subnet-id-0" {
  value = aws_subnet.subnets[0].id
}
output "subnet-id" {
  value = aws_subnet.subnets[1].id
}

output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "subnet-id-2" {
  value = aws_subnet.subnets[2].id
}
output "subnet-id-3" {
  value = aws_subnet.subnets[3].id
}
