provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "lb" {
  source = "../../modules/elb"

  application_public_1_subnet_id = data.terraform_remote_state.network_config.outputs.application_public_1_subnet_id
  application_public_2_subnet_id = data.terraform_remote_state.network_config.outputs.application_public_2_subnet_id
  application_vpc_id = data.terraform_remote_state.network_config.outputs.application_vpc_id
  public_subnet_security_group_id = data.terraform_remote_state.security_group_config.outputs.public_subnet_security_group_id
}