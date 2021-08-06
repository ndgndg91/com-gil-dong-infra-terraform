variable "region" {
  description = "AWS Region"
}

variable "instance_vpc_id" {
  description = "Instance VPC Id"
}

variable "instance_public_subnet_1_cidr_blocks" {
  description = "Instance Public Subnet 1 CIDR Blocks"
}

variable "instance_public_subnet_2_cidr_blocks" {
  description = "Instance Public Subnet 2 CIDR Blocks"
}

variable "instance_private_subnet_1_cidr_blocks" {
  description = "Instance Private Subnet 1 CIDR Blocks"
}

variable "instance_private_subnet_2_cidr_blocks" {
  description = "Instance Private Subnet 2 CIDR Blocks"
}

variable "rds_vpc_id" {
  description = "RDS VPC Id"
}
