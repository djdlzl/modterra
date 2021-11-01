provider "aws" {
  region = var.region
}


resource "aws_key_pair" "jwcho_key" {
  key_name = var.key
  public_key = file("../../../.ssh/id_rsa.pub")
}


resource "aws_vpc" "jwcho_vpc" {    
    cidr_block = var.cidr_main

    tags = {
      "Name" = "${var.name}-vpc"
    }
}

#==============subnet=============================================
#public subnet
resource "aws_subnet" "jwcho_pub" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  count = "${length(var.public_s)}"  # count = 3
  cidr_block = "${var.public_s[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "pub-${var.avazone[count.index]}"
  }
}

#private subnet
resource "aws_subnet" "jwcho_pri" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  count = "${length(var.private_s)}"  # count = 3
  cidr_block = "${var.private_s[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "pri-${var.avazone[count.index]}"
  }
}

#DB subnet
resource "aws_subnet" "jwcho_db" {
  vpc_id     = aws_vpc.jwcho_vpc.id
  count = "${length(var.db_s)}"  # count = 3
  cidr_block = "${var.db_s[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "db-${var.avazone[count.index]}"
  }
}
#============igw=============================
resource "aws_internet_gateway" "jwcho_igw" {
  vpc_id = aws_vpc.jwcho_vpc.id

  tags = {
    Name = "${var.name}-igw"
  }
}

#================route table=============================
resource "aws_route_table" "jwcho_rt" {
  vpc_id = aws_vpc.jwcho_vpc.id

  route {
      cidr_block = var.cidr_internet
      gateway_id = aws_internet_gateway.jwcho_igw.id
  }
  tags = {
    "Name" = "${var.name}-rt"
  }
}
#route table association
resource "aws_route_table_association" "jwcho_rtas_a" {
  count = "${length(var.public_s)}"
  subnet_id = aws_subnet.jwcho_pub[count.index].id
  route_table_id = aws_route_table.jwcho_rt.id
}
