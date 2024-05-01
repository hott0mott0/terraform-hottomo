# ルートテーブル
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.atlantis_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.atlantis_gateway.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.atlantis_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# ダミーサブネットの接続
resource "aws_route_table_association" "public_dummy" {
  subnet_id      = aws_subnet.atlantis_public_dummy.id
  route_table_id = aws_route_table.public_route_table.id
}
