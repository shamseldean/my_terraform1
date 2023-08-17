resource "aws_internet_gateway" "internet_gateway1" {
  vpc_id = aws_vpc.project1.id

  tags = {
    Name = "internet_gateway1"
  }
}