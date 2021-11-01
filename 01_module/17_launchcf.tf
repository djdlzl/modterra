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