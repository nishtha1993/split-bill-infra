variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string
  
}

variable "subnet_cidr" {
    description = "Subnet CIDRS"
    type = list(string)
}

variable "subnet_names" {
    description = "Subnet Names"
    type = list(string)
    default = [ "split_public_subnet_1","split_public_subnet_2" ]
  
}