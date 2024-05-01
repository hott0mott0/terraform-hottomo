resource "aws_ecs_cluster" "atlantis_cluster" {
  name = "atlantis-cluster"

  tags = {
    Name = "AtlantisEcsCluster"
  }
}
