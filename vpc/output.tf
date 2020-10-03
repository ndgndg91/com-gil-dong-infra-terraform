output "instance_vpc_id" {
  value = aws_vpc.instance_vpc.id
}

output "instance_vpc_cidr_blocks" {
  value = aws_vpc.instance_vpc.cidr_block
}

output "rds_vpc_id" {
  value = aws_vpc.rds_vpc.id
}

output "rds_vpc_cidr_blocks" {
  value = aws_vpc.rds_vpc.cidr_block
}

output "instance_public_subnet_1_id" {
  value = aws_subnet.instance_public_subnet_1.id
}

output "instance_public_subnet_1_cidr_blocks" {
  value = aws_subnet.instance_public_subnet_1.cidr_block
}

output "instance_public_subnet_2_id" {
  value = aws_subnet.instance_public_subnet_2.id
}

output "instance_public_subnet_2_cidr_blocks" {
  value = aws_subnet.instance_public_subnet_2.cidr_block
}

output "instance_private_subnet_1_id" {
  value = aws_subnet.instance_private_subnet_1.id
}

output "instance_private_subnet_1_cidr_blocks" {
  value = aws_subnet.instance_private_subnet_1.cidr_block
}

output "instance_private_subnet_2_id" {
  value = aws_subnet.instance_private_subnet_2.id
}

output "instance_private_subnet_2_cidr_blocks" {
  value = aws_subnet.instance_private_subnet_2.cidr_block
}

output "rds_private_subnet_1_id" {
  value = aws_subnet.rds_private_subnet_1.id
}

output "rds_private_subnet_1_cidr_blocks" {
  value = aws_subnet.rds_private_subnet_1.cidr_block
}

output "rds_private_subnet_2_id" {
  value = aws_subnet.rds_private_subnet_2.id
}

output "rds_private_subnet_2_cidr_blocks" {
  value = aws_subnet.rds_private_subnet_2.cidr_block
}