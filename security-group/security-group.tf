provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

data "terraform_remote_state" "network_config" {
  backend = "s3"
  config = {
    bucket = var.remote_network_state_bucket
    key = var.remote_network_state_key
    region = var.region
  }
}

resource "aws_security_group" "instance_public_subnet_security_group" {
  name = "Public ALB Security Group"
  description = "ALB Security Group Allow 80 to 8080"
  vpc_id = data.terraform_remote_state.network_config.outputs.instance_vpc_id

  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public ALB Security Group"
  }
}

resource "aws_security_group" "instance_private_subnet_security_group" {
  name = "Private Instance Security Group"
  description = "Instance In Private Subnet Security Group"
  vpc_id = data.terraform_remote_state.network_config.outputs.instance_vpc_id

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = [data.terraform_remote_state.network_config.outputs.instance_public_subnet_1_cidr_blocks,
                   data.terraform_remote_state.network_config.outputs.instance_public_subnet_2_cidr_blocks]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Private Instance Security Group"
  }
}

resource "aws_security_group" "rds_private_subnet_security_group" {
  name = "RDS Security Group"
  description = "RDS Security Group Allow 3306"
  vpc_id = data.terraform_remote_state.network_config.outputs.rds_vpc_id

  ingress {
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
    cidr_blocks = [data.terraform_remote_state.network_config.outputs.instance_private_subnet_1_cidr_blocks,
                   data.terraform_remote_state.network_config.outputs.instance_private_subnet_2_cidr_blocks]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS Security Group"
  }
}