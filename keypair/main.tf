resource "tls_private_key" "terrafrom_generated_private_key" {
  algorithm = var.encrypt-kind
  rsa_bits  = var.encrypt-bits
}

resource "aws_key_pair" "generated_key" {


  key_name = "key-pair"

  public_key = tls_private_key.terrafrom_generated_private_key.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.terrafrom_generated_private_key.private_key_pem}' > key-pair.pem
      chmod 400 key-pair.pem
    EOT
  }
}
