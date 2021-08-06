output "public_subnet_security_group_id" {
  value = module.security_group.public_subnet_security_group_id
}

output "private_subnet_security_group_id" {
  value = module.security_group.private_subnet_security_group_id
}

output "rds_subnet_security_group_id" {
  value = module.security_group.rds_subnet_security_group_id
}