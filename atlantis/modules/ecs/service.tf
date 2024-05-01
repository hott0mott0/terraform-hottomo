resource "aws_ecs_service" "atlantis_service" {
  name            = "atlantis-service"
  cluster         = aws_ecs_cluster.atlantis_cluster.id
  task_definition = aws_ecs_task_definition.atlantis_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets = [var.atlantis_public_subnet_id]
    security_groups = [var.atlantis_security_group_id]
    assign_public_ip = true
  }

  depends_on = [
    aws_ecs_task_definition.atlantis_task,
    aws_ecs_cluster.atlantis_cluster
  ]
}
