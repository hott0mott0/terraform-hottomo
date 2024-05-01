output "atlantis_vpc_id" {
    value = aws_vpc.atlantis_vpc.id
}

output "atlantis_public_subnet_id" {
    value = aws_subnet.atlantis_public_subnet.id
}

output "atlantis_public_dummy_subnet_id" {
    value = aws_subnet.atlantis_public_dummy.id
}

output "atlantis_security_group_id" {
    value = aws_security_group.atlantis_sg.id
}
