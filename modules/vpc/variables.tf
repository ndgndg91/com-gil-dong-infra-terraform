variable "region" {
  description = "AWS Region"
}

variable "application_vpc_cidr" {
  description = "application Vpc Cidr"
}

variable "rds_vpc_cidr" {
  description = "Rds Vpc Cidr"
}

variable "application_public_1_subnet_cidr" {
  description = "application Public subnet 1"
}

variable "application_public_2_subnet_cidr" {
  description = "application Public subnet 2"
}

variable "application_private_1_subnet_cidr" {
  description = "application Private subnet 1"
}

variable "application_private_2_subnet_cidr" {
  description = "application Private subnet 2"
}

variable "rds_private_1_subnet_cidr" {
  description = "Rds Private subnet 1"
}

variable "rds_private_2_subnet_cidr" {
  description = "Rds Private subnet 2"
}

variable "availability_zone_1" {}

variable "availability_zone_2" {}