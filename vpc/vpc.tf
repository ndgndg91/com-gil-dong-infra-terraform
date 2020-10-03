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

resource "aws_route_table" "instance_public_route_table" {
  vpc_id = aws_vpc.instance_vpc.id

  tags = {
    Name = "Instance public subnet route table"
  }
}

resource "aws_route_table" "instance_private_route_table" {
  vpc_id = aws_vpc.instance_vpc.id

  tags = {
    Name = "Instance private subnet route table"
  }
}

resource "aws_route_table" "rds_private_route_table" {
  vpc_id = aws_vpc.rds_vpc.id

  tags = {
    Name = "RDS private subnet route table"
  }
}

resource "aws_route_table_association" "instance_public_subnet_1_association" {
  route_table_id = aws_route_table.instance_public_route_table.id
  subnet_id = aws_subnet.instance_public_subnet_1.id
}

resource "aws_route_table_association" "instance_public_subnet_2_association" {
  route_table_id = aws_route_table.instance_public_route_table.id
  subnet_id = aws_subnet.instance_public_subnet_2.id
}

resource "aws_route_table_association" "instance_private_subnet_1_association" {
  route_table_id = aws_route_table.instance_private_route_table.id
  subnet_id = aws_subnet.instance_private_subnet_1.id
}

resource "aws_route_table_association" "instance_private_subnet_2_association" {
  route_table_id = aws_route_table.instance_private_route_table.id
  subnet_id = aws_subnet.instance_private_subnet_2.id
}

resource "aws_route_table_association" "rds_private_subnet_1_association" {
  route_table_id = aws_route_table.rds_private_route_table.id
  subnet_id = aws_subnet.rds_private_subnet_1.id
}

resource "aws_route_table_association" "rds_private_subnet_2_association" {
  route_table_id = aws_route_table.rds_private_route_table.id
  subnet_id = aws_subnet.rds_private_subnet_2.id
}

resource "aws_internet_gateway" "instance_vpc_internet_gateway" {
  vpc_id = aws_vpc.instance_vpc.id

  tags = {
    Name = "Instance VPC Internet Gateway"
  }
}

resource "aws_route" "instance_public_internet_gateway_route" {
  route_table_id         = aws_route_table.instance_public_route_table.id
  gateway_id             = aws_internet_gateway.instance_vpc_internet_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_vpc_peering_connection" "instance_vpc_peering_rds_vpc" {
  vpc_id      = aws_vpc.instance_vpc.id // requester
  peer_vpc_id = aws_vpc.rds_vpc.id // accepter
  auto_accept = true
}

resource "aws_route" "instance_private_to_rds_private" {
  route_table_id = aws_route_table.instance_private_route_table.id

  vpc_peering_connection_id = aws_vpc_peering_connection.instance_vpc_peering_rds_vpc.id

  destination_cidr_block = aws_vpc.rds_vpc.cidr_block
}

resource "aws_route" "rds_private_to_instance_private" {
  route_table_id = aws_route_table.rds_private_route_table.id

  vpc_peering_connection_id = aws_vpc_peering_connection.instance_vpc_peering_rds_vpc.id

  destination_cidr_block = aws_vpc.instance_vpc.cidr_block
}