remote_network_state_bucket = "com-gil-dong-terraform-remote-state"
remote_network_state_key = "layer1/infrastructure.tfstate"

remote_security_group_state_bucket = "com-gil-dong-terraform-remote-state"
remote_security_group_state_key = "layer2/security-group.tfstate"

remote_alb_state_bucket = "com-gil-dong-terraform-remote-state"
remote_alb_state_key = "layer3/elb.tfstate"

ec2_instances_type = "t2.micro"
max_instance_size = "15"
min_instance_size = "3"

key_pair_name = "terraform-provision"