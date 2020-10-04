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

// jdk11 설치와 aws cli access_key, secret_key 설정 된 이미지
data "aws_ami" "launch_configuration_ami" {
  most_recent = true
  owners = ["self"]
  name_regex = "^aws-linux2-jdk11.*$"
}

resource "aws_launch_configuration" "ec2_private_launch_configuration" {
  name = "EC2-JPASHOP"
  image_id                    = data.aws_ami.launch_configuration_ami.id
  instance_type               = var.ec2_instances_type
  key_name                    = var.key_pair_name
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  security_groups             = [data.terraform_remote_state.security_group_config.outputs.private_subnet_security_group_id]

  user_data = <<EOF
    #!/bin/bash
    aws s3api get-object --bucket spring-boot-app-jars --key test/jpashop.jar jpashop.jar
    nohup java -jar jpashop.jar &
  EOF
}

resource "aws_launch_configuration" "ec2_public_launch_configuration" {
  name = "EC2-JPASHOP-PUBLIC"
  image_id = data.aws_ami.launch_configuration_ami.id
  instance_type = var.ec2_instances_type
  key_name = var.key_pair_name
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  security_groups = [data.terraform_remote_state.security_group_config.outputs.public_subnet_security_group_id]

  user_data = <<EOF
    #!/bin/bash
    aws s3api get-object --bucket spring-boot-app-jars --key test/jpashop.jar jpashop.jar
    nohup java -jar jpashop.jar &
  EOF
}

//resource "aws_autoscaling_group" "ec2_public_autoscaling_group" {
//  name = "public-test"
//  vpc_zone_identifier = [
//    data.terraform_remote_state.network_config.outputs.instance_public_subnet_1_id,
//    data.terraform_remote_state.network_config.outputs.instance_public_subnet_2_id
//  ]
//  max_size = 2
//  min_size = 1
//  launch_configuration = aws_launch_configuration.ec2_public_launch_configuration.name
//}

//resource "aws_autoscaling_group" "ec2_private_autoscaling_group" {
//  name                  = "Production-Backend-AutoScalingGroup"
//  vpc_zone_identifier   = [
//    data.terraform_remote_state.network_config.outputs.instance_private_subnet_1_id,
//    data.terraform_remote_state.network_config.outputs.instance_private_subnet_2_id,
//  ]
//
//  max_size             = var.max_instance_size
//  min_size             = var.min_instance_size
//  launch_configuration = aws_launch_configuration.ec2_private_launch_configuration.name
//  health_check_type    = "ELB"
//
//  tag {
//    key                 = "Name"
//    propagate_at_launch = false
//    value               = "Backend-EC2-Instance"
//  }
//
//  tag {
//    key                 = "Type"
//    propagate_at_launch = false
//    value               = "Production"
//  }
//}

//resource "aws_autoscaling_policy" "ec2_private_scaling_policy" {
//  autoscaling_group_name = aws_autoscaling_group.ec2_private_autoscaling_group.name
//  name                   = "Production-Backend-AutoScaling-Policy"
//  policy_type              = "TargetTrackingScaling"
//  min_adjustment_magnitude = 1
//
//  target_tracking_configuration {
//    predefined_metric_specification {
//      predefined_metric_type = "ASGAverageCPUUtilization"
//    }
//    target_value = 80.0
//  }
//}