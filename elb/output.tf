output "api_target_group_id" {
  value = aws_alb_target_group.api_target_group.id
}

output "api_target_group_arn" {
  value = aws_alb_target_group.api_target_group.arn
}

output "api_load_balancer_id" {
  value = aws_alb.api_load_balancer.id
}

output "api_load_balancer_dns_name" {
  value = aws_alb.api_load_balancer.dns_name
}

output "api_load_balancer_arn" {
  value = aws_alb.api_load_balancer.arn
}