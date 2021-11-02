#Application LoadBalancer Deploy
resource "aws_lb" "jwcho_lb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.jwcho_websg.id]
  subnets            = [aws_subnet.jwcho_pub[0].id, aws_subnet.jwcho_pub[1].id]

  tags = {
    "Name" = "${var.name}-alb"
  }

}

resource "aws_lb_target_group" "jwcho_lb_tg" {
  name     = "${var.name}-lbtg"
  port     = var.port_http
  protocol = "HTTP"
  vpc_id   = aws_vpc.jwcho_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "jwcho_front-end" {
  load_balancer_arn = aws_lb.jwcho_lb.arn
  port              = var.port_http
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jwcho_lb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "jwcho_lbtg_att" {
  target_group_arn = aws_lb_target_group.jwcho_lb_tg.arn
  target_id        = aws_instance.jwcho_weba.id
  port             = var.port_http
}
