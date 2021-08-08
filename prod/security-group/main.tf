provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "security_group" {
  source = "../../modules/security-group"

  application_private_1_subnet_cidr_blocks = data.terraform_remote_state.network_config.outputs.application_private_1_subnet_cidr_blocks
  application_private_2_subnet_cidr_blocks = data.terraform_remote_state.network_config.outputs.application_private_2_subnet_cidr_blocks
  application_public_1_subnet_cidr_blocks = data.terraform_remote_state.network_config.outputs.application_public_1_subnet_cidr_blocks
  application_public_2_subnet_cidr_blocks = data.terraform_remote_state.network_config.outputs.application_public_2_subnet_cidr_blocks
  application_vpc_cidr_blocks = data.terraform_remote_state.network_config.outputs.application_vpc_cidr_blocks
  application_vpc_id = data.terraform_remote_state.network_config.outputs.application_vpc_id
  rds_vpc_id = data.terraform_remote_state.network_config.outputs.rds_vpc_id
  region = var.region
}