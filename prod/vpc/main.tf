provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "vpc" {
  source = "../../modules/vpc"

  region = var.region
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2

  application_vpc_cidr = var.application_vpc_cidr
  rds_vpc_cidr = var.rds_vpc_cidr
  application_public_1_subnet_cidr = var.application_public_1_subnet_cidr
  application_public_2_subnet_cidr = var.application_public_2_subnet_cidr
  application_private_1_subnet_cidr = var.application_private_1_subnet_cidr
  application_private_2_subnet_cidr = var.application_private_2_subnet_cidr
  rds_private_1_subnet_cidr = var.rds_private_1_subnet_cidr
  rds_private_2_subnet_cidr = var.rds_private_2_subnet_cidr
}