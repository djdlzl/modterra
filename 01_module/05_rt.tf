resource "aws_route_table" "jwcho_rt" {
  vpc_id = aws_vpc.jwcho_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.jwcho_igw.id
  }
  tags = {
    "Name" = "jwcho-rt"
  }
}
