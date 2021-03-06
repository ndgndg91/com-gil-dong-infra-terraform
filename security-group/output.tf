output "public_subnet_security_group_id" {
  value = aws_security_group.instance_public_subnet_security_group.id
}

output "private_subnet_security_group_id" {
  value = aws_security_group.instance_private_subnet_security_group.id
}

output "rds_subnet_security_group_id" {
  value = aws_security_group.rds_private_subnet_security_group.id
}