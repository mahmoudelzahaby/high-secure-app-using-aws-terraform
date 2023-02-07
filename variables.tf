variable "des-all" {
  description = "all in and out"

}

variable "ec2-public" {
  type = list(any)
}
variable "ec2-private" {
  type = list(any)
}

variable "ec2-ami" {
  description = "instance ami"
}

variable "instance_type" {
  description = "ec2 type"
  type        = string
}

variable "def-region" {
  description = "the current working region"
  type        = string
}
