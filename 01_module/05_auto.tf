resource "aws_ami_from_instance" "jwcho_ami" {
  name = "jwcho-ami"   
  source_instance_id = aws_instance.jwcho_weba.id
  depends_on = [
    aws_instance.jwcho_weba
  ]
}

resource "aws_launch_configuration" "jwcho_lacf" {
  name_prefix = "jwcho-web"
  image_id = aws_ami_from_instance.jwcho_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.jwcho_websg.id]
  key_name = "tf-key"
  user_data =<<-EOF
            #!/bin/bash
            systemctl start httpd
            systemctl enable httpd
            EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_placement_group" "jwcho_pg" {
  name     = "jwcho-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "jwcho_atsg" {
  name = "${var.name}-atsg"
  min_size = 2
  max_size = 8
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.jwcho_lacf.name
  vpc_zone_identifier = [aws_subnet.jwcho_pub[0].id,aws_subnet.jwcho_pub[1].id]
}

resource "aws_autoscaling_attachment" "jwcho_atatt" {
 autoscaling_group_name = aws_autoscaling_group.jwcho_atsg.id
 alb_target_group_arn = aws_lb_target_group.jwcho_lb_tg.arn
}