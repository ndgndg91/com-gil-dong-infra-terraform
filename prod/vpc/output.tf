output "application_vpc_id" {
  value = module.vpc.application_vpc_id
}

output "application_vpc_cidr_blocks" {
  value = module.vpc.application_vpc_cidr_blocks
}

output "rds_vpc_id" {
  value = module.vpc.rds_vpc_id
}

output "rds_vpc_cidr_blocks" {
  value = module.vpc.rds_vpc_cidr_blocks
}

output "application_public_1_subnet_id" {
  value = module.vpc.application_public_1_subnet_id
}

output "application_public_2_subnet_id" {
  value = module.vpc.application_public_2_subnet_id
}

output "application_public_1_subnet_cidr_blocks" {
  value = module.vpc.application_public_1_subnet_cidr_blocks
}

output "application_public_2_subnet_cidr_blocks" {
  value = module.vpc.application_public_2_subnet_cidr_blocks
}

output "application_private_1_subnet_id" {
  value = module.vpc.application_private_1_subnet_id
}

output "application_private_2_subnet_id" {
  value = module.vpc.application_private_2_subnet_id
}

output "application_private_1_subnet_cidr_blocks" {
  value = module.vpc.application_private_1_subnet_cidr_blocks
}

output "application_private_2_subnet_cidr_blocks" {
  value = module.vpc.application_private_2_subnet_cidr_blocks
}

output "rds_private_1_subnet_id" {
  value = module.vpc.rds_private_1_subnet_id
}

output "rds_private_2_subnet_id" {
  value = module.vpc.rds_private_2_subnet_id
}

output "rds_private_1_subnet_cidr_blocks" {
  value = module.vpc.rds_private_1_subnet_cidr_blocks
}

output "rds_private_2_subnet_cidr_blocks" {
  value = module.vpc.rds_private_2_subnet_cidr_blocks
}

output "rds_private_1_subnet_availability_zone" {
  value = module.vpc.rds_private_1_subnet_availability_zone
}

output "rds_private_2_subnet_availability_zone" {
  value = module.vpc.rds_private_2_subnet_availability_zone
}

output "nat_gateway_ip" {
  value = module.vpc.nat_gateway_ip
}