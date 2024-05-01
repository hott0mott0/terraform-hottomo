resource "aws_ecs_task_definition" "atlantis_task" {
  family                   = "atlantis"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"  # 必要に応じて変更
  memory                   = "512"  # 必要に応じて変更
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "atlantis"
      image     = "runatlantis/atlantis"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 4141
          hostPort      = 4141
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "ATLANTIS_GH_APP_ID"
          value = "886742"
        },
        {
          name  = "ATLANTIS_GH_APP_KEY"
          value = var.github_app_pubkey
        },
        {
          name = "ATLANTIS_GH_WEBHOOK_SECRET"
          value = var.github_app_webhook_secret
        },
        {
          name = "ATLANTIS_PORT"
          value = "4141"
        },
        {
          name = "ATLANTIS_HIDE_PREV_PLAN_COMMENTS"
          value = "false"
        },
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/atlantis"
          awslogs-region        = "us-west-2"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]
}
