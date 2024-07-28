variable "vpc_cidr"{
    description  = "vpc cidr"
    type = string
}

variable "public_subnets" {
    description = "subnet_cidr"
    type = list(string)

}


variable "private_subnets" {
    description = "subnet_cidr"
    type = list(string)
}