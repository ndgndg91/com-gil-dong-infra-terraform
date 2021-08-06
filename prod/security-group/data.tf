data "terraform_remote_state" "network_config" {
  backend = "s3"
  config = {
    bucket = var.remote_network_state_bucket
    key = var.remote_network_state_key
    region = var.region
  }
}