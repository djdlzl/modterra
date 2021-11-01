resource "aws_route_table" "jwcho_ngart_a" {
  vpc_id = aws_vpc.jwcho_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.jwcho_nga_a.id
  }
  tags = {
    "Name" = "jwcho-natrt-a"
  }
}

resource "aws_route_table" "jwcho_ngart_c" {
  vpc_id = aws_vpc.jwcho_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.jwcho_nga_c.id
  }
  tags = {
    "Name" = "jwcho-natrt-c"
  }
}