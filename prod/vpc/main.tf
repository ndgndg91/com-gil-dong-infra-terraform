provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "vpc" {
  source = "../../modules/vpc"

  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
  instance_private_subnet_cidr_1 = var.instance_private_subnet_cidr_1
  instance_private_subnet_cidr_2 = var.instance_private_subnet_cidr_2
  instance_public_subnet_cidr_1 = var.instance_public_subnet_cidr_1
  instance_public_subnet_cidr_2 = var.instance_public_subnet_cidr_2
  instance_vpc_cidr = var.instance_vpc_cidr
  rds_private_subnet_cidr_1 = var.rds_private_subnet_cidr_1
  rds_private_subnet_cidr_2 = var.rds_private_subnet_cidr_2
  rds_vpc_cidr = var.rds_vpc_cidr
  region = var.region
}