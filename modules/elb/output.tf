output "api_target_group_id" {
  value = aws_alb_target_group.api_target_group.id
}

output "api_load_balancer_id" {
  value = aws_alb.api_load_balancer.id
}

output "api_load_balancer_name" {
  value = aws_alb.api_load_balancer.name
}