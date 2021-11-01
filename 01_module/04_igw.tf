resource "aws_internet_gateway" "jwcho_igw" {
  vpc_id = aws_vpc.jwcho_vpc.id

  tags = {
    Name = "jwcho-igw"
  }
}