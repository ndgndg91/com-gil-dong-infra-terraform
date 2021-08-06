provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "instance" {
  source = "../../modules/instances"

  ec2_instances_type = ""
  key_pair_name = ""
  max_instance_size = ""
  min_instance_size = ""
  region = ""
}