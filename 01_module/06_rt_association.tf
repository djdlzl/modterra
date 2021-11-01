resource "aws_route_table_association" "jwcho_rtas_a" {
  subnet_id = aws_subnet.jwcho_puba.id
  route_table_id = aws_route_table.jwcho_rt.id
}

resource "aws_route_table_association" "jwcho_rtas_c" {
  subnet_id = aws_subnet.jwcho_pubc.id
  route_table_id = aws_route_table.jwcho_rt.id
}