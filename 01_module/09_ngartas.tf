resource "aws_route_table_association" "jwcho_ngartas_a" {
  subnet_id = aws_subnet.jwcho_pria.id
  route_table_id = aws_route_table.jwcho_ngart_a.id
}

resource "aws_route_table_association" "jwcho_ngartas_c" {
  subnet_id = aws_subnet.jwcho_pric.id
  route_table_id = aws_route_table.jwcho_ngart_c.id
}

