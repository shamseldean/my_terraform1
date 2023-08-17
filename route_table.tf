resource "aws_route_table" "public-rout-table" {
  vpc_id = aws_vpc.project1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway1.id
  }


  tags = {
    Name = "public_route_table"
  }
}


resource "aws_route_table" "private-rout-table" {
  vpc_id = aws_vpc.project1.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.aws_nat_gateway1.id
  }


  tags = {
    Name = "public_route_table"
  }
}


resource "aws_route_table_association" "public_association1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public-rout-table.id
}

resource "aws_route_table_association" "public_association2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public-rout-table.id
}

resource "aws_route_table_association" "private_association1" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.private-rout-table.id
}

resource "aws_route_table_association" "private_association2" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.private-rout-table.id
}