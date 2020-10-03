provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

resource "aws_vpc" "instance_vpc" {
  cidr_block = var.instance_vpc_cidr

  tags = {
    Name = "VPC for Applications"
  }
}

resource "aws_vpc" "rds_vpc" {
  cidr_block = var.rds_vpc_cidr

  tags = {
    Name = "VPC for RDS"
  }
}

resource "aws_subnet" "instance_public_subnet_1" {
  cidr_block = var.instance_public_subnet_cidr_1
  vpc_id = aws_vpc.instance_vpc.id
  availability_zone = var.availity_zone_1

  tags = {
    Name = "Instance public subnet 1"
  }
}

resource "aws_subnet" "instance_public_subnet_2" {
  cidr_block = var.instance_public_subnet_cidr_2
  vpc_id = aws_vpc.instance_vpc.id
  availability_zone = var.availity_zone_2

  tags = {
    Name = "Instance public subnet 2"
  }
}

resource "aws_subnet" "instance_private_subnet_1" {
  cidr_block = var.instance_private_subnet_cidr_1
  vpc_id = aws_vpc.instance_vpc.id
  availability_zone = var.availity_zone_1

  tags = {
    Name = "Instance private subnet 1"
  }
}

resource "aws_subnet" "instance_private_subnet_2" {
  cidr_block = var.instance_private_subnet_cidr_2
  vpc_id = aws_vpc.instance_vpc.id
  availability_zone = var.availity_zone_2

  tags = {
    Name = "Instance private subnet 2"
  }
}

resource "aws_subnet" "rds_private_subnet_1" {
  cidr_block = var.rds_private_subnet_cidr_1
  vpc_id = aws_vpc.rds_vpc.id
  availability_zone = var.availity_zone_1

  tags = {
    Name = "RDS private subnet 1"
  }
}

resource "aws_subnet" "rds_private_subnet_2" {
  cidr_block = var.rds_private_subnet_cidr_2
  vpc_id = aws_vpc.rds_vpc.id
  availability_zone = var.availity_zone_2

  tags = {
    Name = "RDS private subnet 2"
  }
}

