resource "aws_db_instance" "jwcho_db" {
  allocated_storage = 10
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "wordpress"
  identifier = "mydb"
  username = "master"
  password = "It123412341!"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-2a"
  vpc_security_group_ids   = [aws_security_group.jwcho_websg.id]
  db_subnet_group_name = aws_db_subnet_group.jwcho_db_sb_group.id
  skip_final_snapshot = true
  tags = {
    "Name" = "mydb"
  }
}


resource "aws_db_subnet_group" "jwcho_db_sb_group" {
  name = "jwcho-db-subnet"
  subnet_ids = [aws_subnet.jwcho_dba.id,aws_subnet.jwcho_dbc.id]

  tags = {
    "Name" = "jwcho-db-sb-group"
  }
}