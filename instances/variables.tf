variable "region" {
  default = "ap-northeast-2"
  description = "AWS Region"
}

variable "remote_network_state_bucket" {
  description = "Network state In S3 Bucket"
}

variable "remote_network_state_key" {
  description = "Network state s3 key"
}

variable "remote_security_group_state_bucket" {
  description = "Security Group state In S3 Bucket"
}

variable "remote_security_group_state_key" {
  description = "Security Group state s3 key"
}

variable "remote_alb_state_bucket" {
  description = "ALB state S3 Bucket"
}

variable "remote_alb_state_key" {
  description = "ALB state s3 key"
}