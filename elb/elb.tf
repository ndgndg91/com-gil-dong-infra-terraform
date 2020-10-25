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

//resource "aws_alb" "api_load_balancer" {
//  name = "API-LoadBalancer"
//  internal = false
//  security_groups = [data.terraform_remote_state.security_group_config.outputs.public_subnet_security_group_id]
//  subnets = [data.terraform_remote_state.network_config.outputs.instance_public_subnet_1_id,
//    data.terraform_remote_state.network_config.outputs.instance_public_subnet_2_id]
//}
//
//resource "aws_alb_target_group" "api_target_group" {
//  name = "API-Target-Group"
//  port = 80
//  protocol = "HTTP"
//  vpc_id = data.terraform_remote_state.network_config.outputs.instance_vpc_id
//  target_type = "instance"
//
//  health_check {
//    interval = 30
//    path = "/hello"
//    healthy_threshold = 5
//    unhealthy_threshold = 5
//  }
//
//  tags = {
//    Name = "Application Target Group"
//  }
//}

//resource "aws_alb_listener" "api_http_listener" {
//  load_balancer_arn = aws_alb.api_load_balancer.arn
//  port = 80
//  protocol = "HTTP"
//
//  default_action {
//    target_group_arn = aws_alb_target_group.api_target_group.arn
//    type = "forward"
//  }
//}