variable "atlantis_vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "atlantis_public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "atlantis_public_dummy_subnet_id" {
  description = "The ID of the public dummy subnet"
  type        = string
}

variable "atlantis_security_group_id" {
  description = "The ID of the security group"
  type        = string
}
