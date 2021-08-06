provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "lb" {
  source = "../../modules/elb"

  instance_public_subnet_1_id = data.terraform_remote_state.network_config.outputs.instance_public_subnet_1_id
  instance_public_subnet_2_id = data.terraform_remote_state.network_config.outputs.instance_public_subnet_2_id
  instance_vpc_id =  data.terraform_remote_state.network_config.outputs.instance_vpc_id
  public_subnet_security_group_id =  data.terraform_remote_state.security_group_config.outputs.public_subnet_security_group_id
}