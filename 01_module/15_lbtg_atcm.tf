resource "aws_lb_target_group_attachment" "jwcho_lbtg_att" {
  target_group_arn = aws_lb_target_group.jwcho_lb_tg.arn
  target_id        = aws_instance.jwcho_weba.id
  port             = 80
}