#AZ-a / public subnet
resource "aws_subnet" "jwcho_puba" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jwcho-puba"
  }
}
#AZ-a / private subnet
resource "aws_subnet" "jwcho_pria" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jwcho-pria"
  }
}
#AZ-c / public subnet
resource "aws_subnet" "jwcho_pubc" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jwcho-pubc"
  }
}
#AZ-c / private subnet
resource "aws_subnet" "jwcho_pric" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jwcho-pric"
  }
}

#AZ-a / db subnet
resource "aws_subnet" "jwcho_dba" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jwcho-dba"
  }
}

#AZ-c / db subnet
resource "aws_subnet" "jwcho_dbc" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jwcho-dbc"
  }
}