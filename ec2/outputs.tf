

output "ec2_id" {
  value = aws_instance.name[0].id
}

output "ec2_id-1" {
  value = aws_instance.name[1].id
}