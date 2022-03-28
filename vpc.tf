resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"

  tags = {
      Name = "talent-academy-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "talent-academy-igw"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.example.id
  connectivity_type = "public"
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "talent-academy-nat-gw "
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}
