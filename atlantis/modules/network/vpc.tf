resource "aws_vpc" "default" {
  cidr_block = local.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "atlantis-vpc"
  }
}
