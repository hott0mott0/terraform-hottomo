# セキュリティグループ
resource "aws_security_group" "atlantis_sg" {
  name        = "atlantis_sg"
  description = "Security group for Atlantis in Fargate"
  vpc_id      = aws_vpc.atlantis_vpc.id

  ingress {
    from_port   = 4141
    to_port     = 4141
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # 全てのポートとプロトコルを許可
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AtlantisSecurityGroup"
  }
}
