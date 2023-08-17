resource "aws_nat_gateway" "aws_nat_gateway1" {
  allocation_id = aws_eip.elastic_ip_gate.id
  subnet_id     = aws_subnet.public-subnet1.id

  tags = {
    Name = "aws_nat_gateway"
  }
  depends_on = [aws_internet_gateway.internet_gateway1]
}