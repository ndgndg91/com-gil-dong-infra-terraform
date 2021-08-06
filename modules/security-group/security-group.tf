resource "aws_security_group" "instance_public_subnet_security_group" {
  name = "Public ALB Security Group"
  description = "ALB Security Group Allow 80 to 80"
  vpc_id = var.instance_vpc_id

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

resource "aws_security_group" "open_vpn_security_group" {
  name = "Open VPN Security Group"
  description = "Open VPN Security Group Allow SSH, UDP"
  vpc_id = var.instance_vpc_id

  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    protocol = "TCP"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    protocol = "UDP"
    to_port = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Open VPN Security Group"
  }
}

resource "aws_security_group" "instance_private_subnet_security_group" {
  name = "Private Instance Security Group"
  description = "Instance In Private Subnet Security Group"
  vpc_id = var.instance_vpc_id

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = [
      var.instance_public_subnet_1_cidr_blocks,
      var.instance_public_subnet_2_cidr_blocks,
    ]
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
  vpc_id = var.rds_vpc_id

  ingress {
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
    cidr_blocks = [
      var.instance_private_subnet_1_cidr_blocks,
      var.instance_private_subnet_2_cidr_blocks,
    ]
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