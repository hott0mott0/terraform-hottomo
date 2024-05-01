resource "aws_lb" "atlantis_lb" {
  name               = "atlantis-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.atlantis_security_group_id]
  subnets            = [var.atlantis_public_subnet_id, var.atlantis_public_dummy_subnet_id]
}

resource "aws_lb_target_group" "atlantis_tg" {
  name     = "atlantis-tg"
  port     = 4141
  protocol = "HTTP"
  vpc_id   = var.atlantis_vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/healthz"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "atlantis_listener" {
  load_balancer_arn = aws_lb.atlantis_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.atlantis_tg.arn
  }
}
