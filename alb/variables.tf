variable "target_name" { 
}
variable "target_port" { 
}
variable "target_protocol" { 
}
variable "target_vpc_id" { 
}

# target group attachments variables
# variable "attach_target_group" { 
# }
variable "attach_target_id" { 
}
variable "attach_target_port" { 
}


# load balancer variables
variable "lb_name" {
}
variable "lb_internal" { 
}
variable "lb_type" {
}
variable "lb_security_group" { 
}
variable "lb_subnet" { 
    type = map
}


# load balancer listener variables
# variable "listener_lb_arn" {
# }
variable "listener_port" { 
}
variable "listener_protocol" {
}
variable "listener_type" { 
}