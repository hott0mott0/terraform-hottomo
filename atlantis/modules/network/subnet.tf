# サブネットを作成
## パブリックサブネットの作成
resource "aws_subnet" "PublicSubnet" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = local.region

  tags = {
    Name = "PublicSubnet"
  }
}

## プライベートサブネットの作成
resource "aws_subnet" "PrivateSubnet" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = local.region

  tags = {
    Name = "PrivateSubnet"
  }
}
