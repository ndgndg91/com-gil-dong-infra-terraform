output "instance_vpc_id" {
  value = module.vpc.instance_vpc_id
}

output "instance_vpc_cidr_blocks" {
  value = module.vpc.instance_vpc_cidr_blocks
}

output "rds_vpc_id" {
  value = module.vpc.rds_vpc_id
}

output "rds_vpc_cidr_blocks" {
  value = module.vpc.rds_vpc_cidr_blocks
}

output "instance_public_subnet_1_id" {
  value = module.vpc.instance_public_subnet_1_id
}

output "instance_public_subnet_1_cidr_blocks" {
  value =  module.vpc.instance_public_subnet_1_cidr_blocks
}

output "instance_public_subnet_2_id" {
  value = module.vpc.instance_public_subnet_2_id
}

output "instance_public_subnet_2_cidr_blocks" {
  value = module.vpc.instance_public_subnet_2_cidr_blocks
}

output "instance_private_subnet_1_id" {
  value = module.vpc.instance_private_subnet_1_id
}

output "instance_private_subnet_1_cidr_blocks" {
  value = module.vpc.instance_private_subnet_1_cidr_blocks
}

output "instance_private_subnet_2_id" {
  value = module.vpc.instance_private_subnet_2_id
}

output "instance_private_subnet_2_cidr_blocks" {
  value = module.vpc.instance_private_subnet_2_cidr_blocks
}

output "rds_private_subnet_1_id" {
  value = module.vpc.rds_private_subnet_1_id
}

output "rds_private_subnet_1_cidr_blocks" {
  value = module.vpc.rds_private_subnet_1_cidr_blocks
}

output "rds_private_subnet_2_id" {
  value = module.vpc.rds_private_subnet_2_id
}

output "rds_private_subnet_2_cidr_blocks" {
  value = module.vpc.rds_private_subnet_2_cidr_blocks
}