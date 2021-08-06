data "terraform_remote_state" "network_config" {
  backend = "s3"
  config = {
    bucket = var.remote_network_state_bucket
    key = var.remote_network_state_key
    region = var.region
  }
}

data "terraform_remote_state" "security_group_config" {
  backend = "s3"
  config = {
    bucket = var.remote_security_group_state_bucket
    key = var.remote_security_group_state_key
    region = var.region
  }
}

data "terraform_remote_state" "alb_config" {
  backend = "s3"
  config = {
    bucket = var.remote_alb_state_bucket
    key = var.remote_alb_state_key
    region = var.region
  }
}