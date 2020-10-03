variable "region" {
  default = "ap-northeast-2"
  description = "AWS Region"
}

variable "instance_vpc_cidr" {
  default = "10.100.0.0/16"
  description = "Instance Vpc Cidr"
}

variable "rds_vpc_cidr" {
  default = "10.200.0.0/16"
  description = "Rds Vpc Cidr"
}

variable "instance_public_subnet_cidr_1" {
  description = "Instance Public subnet 1"
}

variable "instance_public_subnet_cidr_2" {
  description = "Instance Public subnet 2"
}

variable "instance_private_subnet_cidr_1" {
  description = "Instance Private subnet 1"
}

variable "instance_private_subnet_cidr_2" {
  description = "Instance Private subnet 2"
}

variable "rds_private_subnet_cidr_1" {
  description = "Rds Private subnet 1"
}

variable "rds_private_subnet_cidr_2" {
  description = "Rds Private subnet 2"
}

variable "availity_zone_1" {
  default = "ap-northeast-2a"
}

variable "availity_zone_2" {
  default = "ap-northeast-2c"
}