variable "region" {
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

variable "ec2_instances_type" {
  description = "EC2 Instance type to launch"
}

variable "key_pair_name" {
  description = "Keypair to use to connect to EC2 Instances"
}

variable "max_instance_size" {
  description = "Maximum number of instances to launch"
}

variable "min_instance_size" {
  description = "Minimum number of instance to launch"
}