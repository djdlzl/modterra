#Application LoadBalancer Deploy
resource "aws_lb" "jwcho_lb" {
  name                  = "jwcho-alb"
  internal              = false
  load_balancer_type    = "application"
  security_groups       = [aws_security_group.jwcho_websg.id]
  subnets               = [aws_subnet.jwcho_puba.id,aws_subnet.jwcho_pubc.id]
  
  tags = {
    "Name" = "jwcho-alb"
  }

}