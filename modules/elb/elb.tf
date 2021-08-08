resource "aws_alb" "api_load_balancer" {
  name            = "API-LoadBalancer"
  internal        = false
  security_groups = [
    var.public_subnet_security_group_id
  ]

  subnets         = [
    var.application_public_1_subnet_id,
    var.application_public_2_subnet_id,
  ]
}

resource "aws_alb_target_group" "api_target_group" {
  name     = "API-Target-Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.application_vpc_id
  target_type = "instance"

  health_check {
    interval            = 30
    path                = "/hello"
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  tags = {
    Name = "Application Target Group"
  }
}

resource "aws_alb_listener" "api_http_listener" {
  load_balancer_arn = aws_alb.api_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.api_target_group.arn
    type             = "forward"
  }
}