resource "aws_vpc" "jwcho_vpc" {    
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "jwcho-vpc"
    }
}