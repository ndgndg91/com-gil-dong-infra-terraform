output "public_subnet_security_group_id" {
  value = aws_security_group.application_public_subnet_security_group.id
}

output "public_subnet_security_group_name" {
  value = aws_security_group.application_public_subnet_security_group.name
}

output "private_subnet_security_group_id" {
  value = aws_security_group.application_private_subnet_security_group.id
}

output "private_subnet_security_group_name" {
  value = aws_security_group.application_private_subnet_security_group.name
}

output "open_vpn_security_group_id" {
  value = aws_security_group.open_vpn_security_group.id
}

output "open_vpn_security_group_name" {
  value = aws_security_group.open_vpn_security_group.name
}

output "rds_subnet_security_group_id" {
  value = aws_security_group.rds_private_subnet_security_group.id
}

output "rds_subnet_security_group_name" {
  value = aws_security_group.rds_private_subnet_security_group.name
}