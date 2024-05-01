# InternetGatewayの設定
resource "aws_internet_gateway" "atlantis_gateway" {
  vpc_id = aws_vpc.atlantis_vpc.id
}

# EIPを作成
resource "aws_eip" "atlantis_eip" {
  vpc = true
}

# NAT Gatewayを構築
resource "aws_nat_gateway" "private_gateway" {
  allocation_id = aws_eip.atlantis_eip.id
  subnet_id     = aws_subnet.atlantis_public_subnet.id

  tags = {
    Name = "atlantis_nat_gateway"
  }
}
