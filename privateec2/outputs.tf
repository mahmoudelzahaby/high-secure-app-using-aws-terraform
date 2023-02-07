output "ec2-id" {
  value = aws_instance.ec2_instance[0].id
}

output "ec2-id-1" {
  value = aws_instance.ec2_instance[1].id
}