
resource "aws_instance" "ec2_instance" {
  count = length(var.ec2_name)
  ami             = var.ec2_ami_id
  instance_type   = var.ec2_instance_type
  subnet_id       = var.ec2_subnet_ip[count.index]
  vpc_security_group_ids = var.ec2_security_gr
  key_name = var.ec2_key_name
  user_data = var.user_data
  tags = {
    Name = var.ec2_name[count.index]
  }
  provisioner "local-exec" {
    command = "echo Private EC2 ip: ${self.private_ip} >> ./private_ip.txt"
  }
}

