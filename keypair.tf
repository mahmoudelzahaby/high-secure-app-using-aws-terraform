module "key-pair" {
  source       = "./keypair"
  encrypt-kind = "RSA"
  encrypt-bits = 4096
}