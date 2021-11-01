resource "aws_lb_listener" "jwcho_front-end" {
  load_balancer_arn = aws_lb.jwcho_lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type  = "forward"
    target_group_arn = aws_lb_target_group.jwcho_lb_tg.arn
  }
}