resource "aws_autoscaling_attachment" "jwcho_atatt" {
 autoscaling_group_name = aws_autoscaling_group.jwcho_atsg.id
 alb_target_group_arn = aws_lb_target_group.jwcho_lb_tg.arn
}