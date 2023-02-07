resource "aws_instance" "name" {
  count = length(var.ec2-name)
  ami                         = var.ami-ec2
  instance_type               = var.instance_type-1
  associate_public_ip_address = var.pub-ip
  subnet_id                   = var.id-subnet[count.index]
  key_name = var.key-name 
  vpc_security_group_ids = [var.sg-id]

  tags = {
    "name" = var.ec2-name[count.index]
  }

  connection {
    type     = var.ec2_connection_type 
    user     = var.ec2_connection_user 
    private_key = file(var.ec2_connection_private_key) 
    host     = self.public_ip 
  }

  provisioner "file" {
    source      = var.ec2_provisioner_file_source 
    destination = var.ec2_provisioner_file_destination 
  }

  provisioner "remote-exec" {
    inline = var.ec2_provisioner_inline
  }

  provisioner "local-exec" {
    command = "echo Public EC2 ip: ${self.public_ip} >> ./public_ip.txt"
  }
}