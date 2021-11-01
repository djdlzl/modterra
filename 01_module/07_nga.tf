resource "aws_eip" "lb_ip-a" {
    #instance = aws_instace.web.id
    vpc = true
    tags = {
      "Name" = "jwcho-IP-a"
    }
}

resource "aws_eip" "lb_ip-c" {
    #instance = aws_instace.web.id
    vpc = true
    tags = {
      "Name" = "jwcho-IP-c"
    }
}

resource "aws_nat_gateway" "jwcho_nga_a" {
  allocation_id = aws_eip.lb_ip-a.id
  subnet_id     = aws_subnet.jwcho_pria.id
  tags = {
    "Name" = "jwcho-nga-a"
  }
}


resource "aws_nat_gateway" "jwcho_nga_c" {
  allocation_id = aws_eip.lb_ip-c.id
  subnet_id     = aws_subnet.jwcho_pric.id
  tags = {
    "Name" = "jwcho-nga-c"
  }
}