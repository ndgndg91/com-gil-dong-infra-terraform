variable "region" {
  description = "AWS Region"
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