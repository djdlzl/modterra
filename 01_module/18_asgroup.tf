resource "aws_placement_group" "jwcho_pg" {
  name     = "jwcho-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "jwcho_atsg" {
  name = "jwcho-atsg"
  min_size = 2
  max_size = 8
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.jwcho_lacf.name
  vpc_zone_identifier = [aws_subnet.jwcho_puba.id,aws_subnet.jwcho_pubc.id]
}