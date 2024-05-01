# サブネットを作成
## パブリックサブネットの作成
resource "aws_subnet" "atlantis_public_subnet" {
  vpc_id            = aws_vpc.atlantis_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = local.region_a

  tags = {
    Name = "AtlantisPublicSubnet"
  }
}

## プライベートサブネットの作成
resource "aws_subnet" "atlantis_private_subnet" {
  vpc_id            = aws_vpc.atlantis_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = local.region_a

  tags = {
    Name = "AtlantisPrivateSubnet"
  }
}

# ダミーサブネットの作成
resource "aws_subnet" "atlantis_public_dummy" {
  vpc_id                  = aws_vpc.atlantis_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = local.region_b

  tags = {
    Name        = "AtlantisPublicDummySubnet"
  }
}
