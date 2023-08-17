############public_subnet#############
resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.project1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.project1.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "public_subnet_2"
  }
}


###########private_subnet#############
resource "aws_subnet" "private-subnet1" {
  vpc_id            = aws_vpc.project1.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private_subnet1"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id            = aws_vpc.project1.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet2"
  }
}