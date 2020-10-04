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

data "terraform_remote_state" "security_group_config" {
  backend = "s3"
  config = {
    bucket = var.remote_security_group_state_bucket
    key = var.remote_security_group_state_key
    region = var.region
  }
}

data "terraform_remote_state" "alb_config" {
  backend = "s3"
  config = {
    bucket = var.remote_alb_state_bucket
    key = var.remote_alb_state_key
    region = var.region
  }
}


resource "aws_iam_role" "ec2_iam_role" {
  name                = "EC2-IAM-ROLE"
  assume_role_policy  = <<EOF
{
  "Version" : "2012-10-17",
  "Statement" :
  [
    {
      "Effect" : "Allow",
      "Principal" : {
        "Service" : ["ec2.amazonaws.com", "application-autoscaling.amazonaws.com"]
      },
      "Action" : "sts:AssumeRole"
    }
  ]
}
  EOF
}

resource "aws_iam_role_policy" "ec2_iam_role_policy" {
  name = "EC2-IAM-POLICY"
  role = aws_iam_role.ec2_iam_role.id
  policy = <<EOF
{
  "Version" : "2012-10-17",
  "Statement" : [
    {
      "Effect" : "Allow",
      "Action" :  [
        "ec2:*",
        "elasticloadbalancing:*",
        "cloudwatch:*",
        "logs:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "EC2-IAM-Instances-Profile"
  role = aws_iam_role.ec2_iam_role.name
}

data "aws_ami" "launch_configuration_ami" {
  most_recent = true
  owners = ["amazon"]
}

resource "aws_launch_configuration" "ec2_private_launch_configuration" {
  image_id                    = data.aws_ami.launch_configuration_ami.id
  instance_type               = var.ec2_instances_type
  key_name                    = var.key_pair_name
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  security_groups             = [data.terraform_remote_state.security_group_config.outputs.private_subnet_security_group_id]

  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum remove java-1.7.0-openjdk
    sudo curl -o java11.rpm https://d3pxv6yz143wms.cloudfront.net/11.0.5.10.1/java-11-amazon-corretto-devel-11.0.5.10-1.x86_64.rpm https://d3pxv6yz143wms.cloudfront.net/11.0.5.10.1/java-11-amazon-corretto-devel-11.0.5.10-1.x86_64.rpm
    sudo yum localinstall java11.rpm -y
  EOF
}