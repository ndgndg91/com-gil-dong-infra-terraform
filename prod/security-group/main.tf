provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "security_group" {
  source = "../../modules/security-group"

  instance_private_subnet_1_cidr_blocks = data.terraform_remote_state.network_config.outputs.instance_private_subnet_1_cidr_blocks
  instance_private_subnet_2_cidr_blocks = data.terraform_remote_state.network_config.outputs.instance_private_subnet_2_cidr_blocks
  instance_public_subnet_1_cidr_blocks = data.terraform_remote_state.network_config.outputs.instance_public_subnet_1_cidr_blocks
  instance_public_subnet_2_cidr_blocks = data.terraform_remote_state.network_config.outputs.instance_public_subnet_2_cidr_blocks
  instance_vpc_id =  data.terraform_remote_state.network_config.outputs.instance_vpc_id
  rds_vpc_id =  data.terraform_remote_state.network_config.outputs.rds_vpc_id
  region = var.region
}