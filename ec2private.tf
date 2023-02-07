
module "ec2_private_01" {
  source            = "./privateec2"
  ec2_ami_id        = var.ec2-ami
  ec2_instance_type = var.instance_type
  ec2_name          = var.ec2-private
  ec2_subnet_ip     = [module.vpc.subnet-id-2, module.vpc.subnet-id-3]
  ec2_security_gr   = [module.security-group.sg]
  ec2_key_name      = "key-pair"
  user_data         = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install nginx -y
    sudo systemctl start nginx
    sudo systemctl enable nginx
    sudo chmod 777 /var/www/html
    sudo chmod 777 /var/www/html/index.nginx-debian.html
    sudo echo "<h1>Hello World! - Nathan from private EC2 02</h1>" > /var/www/html/index.nginx-debian.html
    sudo systemctl restart nginx
  EOF
}