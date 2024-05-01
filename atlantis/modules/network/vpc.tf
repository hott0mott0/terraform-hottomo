resource "aws_vpc" "atlantis_vpc" {
  cidr_block = local.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "AtlantisVPC"
  }
}
